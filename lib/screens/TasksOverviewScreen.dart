import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/screens/Tasks/DailyTasksScreen.dart';
import 'package:organizer_app/screens/Tasks/TasksScreen.dart';
import 'package:organizer_app/widgets/CustomBottomAppBar.dart';
import 'package:organizer_app/widgets/CustomTopAppBarMainPage.dart';
import 'package:organizer_app/widgets/ThreePointPopUpMenu.dart';

import '../core/model/Task.dart';
import 'Tasks/AddTaskScreen.dart';

class TaskOverviewScreen extends StatefulWidget {
  TaskOverviewScreen({super.key});

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  State<TaskOverviewScreen> createState() => _TaskOverviewScreenState();
}

class _TaskOverviewScreenState extends State<TaskOverviewScreen> {
  final List<Task> dailyTaskList = <Task>[
    Task(true, "Daily Task 1", DateTime(0), "", false),
    Task(true, "Daily Task 2", DateTime(0), "", false),
    Task(true, "Daily Task 3", DateTime(0), "", false),
  ];

  final List<Task> notDailyTaskList = <Task>[
    Task(false, "Task 1", DateTime(2022, 1, 20), "Meeting 1", false),
    /*Task(false, "Task 2", DateTime(2022, 1, 21), "Meeting 2", false),
    Task(false, "Task 3", DateTime(2022, 1, 22), "Meeting 3", false),*/
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 20.0;

    return SafeArea(
      child: Scaffold(
        appBar: CustomTopAppBarMainPage(
            title: "Aufgaben",
            showThreePoints: true,
            menu: ThreePointPopUpMenu(
                onSelected: (int result) {},
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
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return _buildSingleTask(index, dailyTaskList);
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
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return _buildSingleTask(index, notDailyTaskList);
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

  Widget _buildSingleTask(int index, List isCheckedList) {
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

  Row _createSingleTask(List<dynamic> isCheckedList, int index) {
    if (isCheckedList[index].isDaily) {
      return Row(
        children: [
          Transform.scale(
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
                setState(() {
                  isCheckedList[index].done = !isCheckedList[index].done;
                });
              },
            ),
          ),
          Text(
            isCheckedList[index].name,
            style: isCheckedList[index].done
                ? const TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.white,
                  )
                : const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Transform.scale(
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
                setState(() {
                  isCheckedList[index].done = !isCheckedList[index].done;
                });
              },
            ),
          ),
          Text(
            isCheckedList[index].name,
            style: isCheckedList[index].done
                ? const TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.white,
                  )
                : const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(120.0, 15.0, 10.0, 10.0),
            child: Column(
              children: [
                Text(
                  " ${DateFormat("dd.MM.yyyy").format(isCheckedList[index].dueDate)}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  isCheckedList[index].description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }
  }
}
