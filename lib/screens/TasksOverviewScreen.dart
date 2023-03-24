import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/screens/Tasks/DailyTasksScreen.dart';
import 'package:organizer_app/screens/Tasks/TaskCategory/TaskCategoryScreen.dart';
import 'package:organizer_app/screens/Tasks/TasksScreen.dart';
import 'package:organizer_app/widgets/CustomBottomAppBar.dart';
import 'package:organizer_app/widgets/CustomTopAppBarMainPage.dart';
import 'package:organizer_app/widgets/ThreePointPopUpMenu.dart';

import '../core/FireStoreFutures/GetTasksFutures.dart';
import '../core/model/Task.dart';
import 'Tasks/AddTaskScreen.dart';

class TaskOverviewScreen extends StatelessWidget {
  TaskOverviewScreen({super.key});

  FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<Task>> dailyTasksStream() {
    try {
      return db
          .collection("task")
          .where("isDaily", isEqualTo: true)
          .snapshots()
          .map((tasks) {
        final List<Task> dailyTasksFromFirestore = <Task>[];
        for (final DocumentSnapshot<Map<String, dynamic>> doc in tasks.docs) {
          dailyTasksFromFirestore.add(Task.fromDocumentSnapshot(doc: doc));
        }
        return dailyTasksFromFirestore;
      });
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Task>> notDailyTasksStream() {
    try {
      return db
          .collection("task")
          .where("isDaily", isEqualTo: false)
          .snapshots()
          .map((tasks) {
        final List<Task> dailyTasksFromFirestore = <Task>[];
        for (final DocumentSnapshot<Map<String, dynamic>> doc in tasks.docs) {
          dailyTasksFromFirestore.add(Task.fromDocumentSnapshot(doc: doc));
        }
        return dailyTasksFromFirestore;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 20.0;

    return SafeArea(
      child: Scaffold(
        appBar: CustomTopAppBarMainPage(
            title: "Aufgaben",
            showThreePoints: true,
            menu: ThreePointPopUpMenu(
                onSelected: (int result) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TaskCategoryScreen()));
                },
                entries: const ["Kategorie-Einstellungen"]).build(context)),
        bottomNavigationBar: CustomBottomAppBar(
          mainPage: MainPages.TaskScreen,
          isMainPage: true,
        ),
        backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddTaskScreen()));
          },
          backgroundColor:
              CustomMaterialThemeColorConstant.dark.primaryContainer,
          child: Icon(
            Icons.add,
            color: CustomMaterialThemeColorConstant.dark.onSurface,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DailyTasksScreen()));
                  },
                  child: Column(
                    children: [
                      Container(
                          width: width,
                          decoration: BoxDecoration(
                            color:
                                CustomMaterialThemeColorConstant.dark.surface5,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              topLeft: Radius.circular(30.0),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 5.0),
                            child: Text(
                              "Tägliche Aufgaben",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          )),
                      StreamBuilder(
                          stream: dailyTasksStream(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return _buildSingleTask(
                                        index, snapshot.data!, context);
                                  });
                            } else if (snapshot.hasError) {
                              Text("${snapshot.error}");
                            }
                            return const Center(
                                child: CircularProgressIndicator());
                          })
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TasksScreen()));
                  },
                  child: Column(
                    children: [
                      Container(
                          width: width,
                          decoration: BoxDecoration(
                            color:
                                CustomMaterialThemeColorConstant.dark.surface5,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              topLeft: Radius.circular(30.0),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 5.0),
                            child: Text(
                              "Aufgaben",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          )),
                      StreamBuilder(
                          stream: notDailyTasksStream(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return _buildSingleTask(
                                        index, snapshot.data!, context);
                                  });
                            } else if (snapshot.hasError) {
                              Text("${snapshot.error}");
                            }
                            return const Center(
                                child: CircularProgressIndicator());
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox addSeparator({height = double}) {
    return SizedBox(
      height: height,
    );
  }

  Widget _buildSingleTask(
      int index, List<Task> isCheckedList, BuildContext context) {
    if (index >= isCheckedList.length) {
      if (index == 2) {
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 20.0,
              height: 2,
              color: Colors.black,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20.0,
              height: 75,
              decoration: BoxDecoration(
                color: CustomMaterialThemeColorConstant.dark.surface5,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 20.0,
              height: 2,
              color: Colors.black,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20.0,
              height: 75,
              color: CustomMaterialThemeColorConstant.dark.surface5,
            ),
          ],
        );
      }
    }
    if (index == 2) {
      return Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 20.0,
            height: 2,
            color: Colors.black,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 20.0,
            height: 75,
            decoration: BoxDecoration(
              color: CustomMaterialThemeColorConstant.dark.surface5,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)),
            ),
            child: _createSingleTask(isCheckedList, index),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 20.0,
            height: 2,
            color: Colors.black,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 20.0,
            height: 75,
            color: CustomMaterialThemeColorConstant.dark.surface5,
            child: _createSingleTask(isCheckedList, index),
          ),
        ],
      );
    }
  }

  Widget _createSingleTask(List<Task> isCheckedList, int index) {
    if (isCheckedList[index].isDaily) {
      return FutureBuilder(
        future: getTaskCategoryName(isCheckedList[index].taskCategory.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListTile(
              title: Text(
                isCheckedList[index].name,
                style: isCheckedList[index].done
                    ? TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 3,
                        fontSize: 20,
                        color: CustomMaterialThemeColorConstant.dark.onSurface,
                      )
                    : TextStyle(
                        fontSize: 20,
                        color: CustomMaterialThemeColorConstant.dark.onSurface,
                      ),
              ),
              leading: Transform.scale(
                scale: 1.3,
                child: Checkbox(
                  side: BorderSide(
                      color: CustomMaterialThemeColorConstant.dark.secondary,
                      width: 1.5),
                  shape: const CircleBorder(),
                  checkColor: Colors.white,
                  activeColor: CustomMaterialThemeColorConstant.light.primary,
                  value: isCheckedList[index].done,
                  onChanged: (bool? value) {
                    updateDone(task: isCheckedList[index]);
                  },
                ),
              ),
              subtitle: Text(
                "${snapshot.data?.name}",
                style: TextStyle(
                    color: CustomMaterialThemeColorConstant.dark.onSurface,
                    fontSize: 16),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: Container(
              width: 20,
              height: 20,
              child: const CircularProgressIndicator(),
            ),
          );
        },
      );
    } else {
      return FutureBuilder(
        future: getTaskCategoryName(isCheckedList[index].taskCategory.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListTile(
              title: Text(
                isCheckedList[index].name,
                style: isCheckedList[index].done
                    ? TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 3,
                        fontSize: 20,
                        color: CustomMaterialThemeColorConstant.dark.onSurface,
                      )
                    : TextStyle(
                        fontSize: 20,
                        color: CustomMaterialThemeColorConstant.dark.onSurface,
                      ),
              ),
              subtitle: Text(
                "${snapshot.data?.name}",
                style: TextStyle(
                    color: CustomMaterialThemeColorConstant.dark.onSurface,
                    fontSize: 16),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    " ${DateFormat("dd.MM.yyyy").format(isCheckedList[index].dueDate)}",
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomMaterialThemeColorConstant.dark.onSurface),
                  ),
                  Text(
                    isCheckedList[index].description,
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomMaterialThemeColorConstant.dark.onSurface),
                  ),
                ],
              ),
              leading: Transform.scale(
                scale: 1.3,
                child: Checkbox(
                  side: BorderSide(
                      color: CustomMaterialThemeColorConstant.dark.secondary,
                      width: 1.5),
                  shape: const CircleBorder(),
                  checkColor: Colors.white,
                  activeColor: CustomMaterialThemeColorConstant.light.primary,
                  value: isCheckedList[index].done,
                  onChanged: (bool? value) {
                    updateDone(task: isCheckedList[index]);
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: Container(
              width: 20,
              height: 20,
              child: const CircularProgressIndicator(),
            ),
          );
        },
      );
    }
  }
}
