import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/screens/Tasks/DailyTasksScreen.dart';
import 'package:organizer_app/screens/Tasks/TasksScreen.dart';
import 'package:organizer_app/widgets/CustomBottomAppBar.dart';
import 'package:organizer_app/widgets/CustomTopAppBar.dart';
import 'package:organizer_app/widgets/ThreePointPopUpMenu.dart';

import '../../core/model/Task.dart';
import 'AddTaskScreen.dart';

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
    Task(false, "Task 2", DateTime(2022, 1, 21), "Meeting 2", false),
    Task(false, "Task 3", DateTime(2022, 1, 22), "Meeting 3", false),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 20.0;

    return SafeArea(
      child: Scaffold(
        appBar: CustomTopAppBar(
            title: "Aufgaben",
            showThreePoints: true,
            menu: ThreePointPopUpMenu(
                onSelected: (int result) {},
                entries: const ["Kategorie-Einstellungen"]).build(context)),
        bottomNavigationBar: CustomBottomAppBar(
          mainPage: MainPages.TaskScreen,
          currentPage: CurrentPages.task.TaskOverviewScreen,
        ),
        backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddTaskScreen()));
          },
          backgroundColor:
          CustomMaterialThemeColorConstant.dark.primaryContainer,
          child: Icon(
            Icons.add,
            color: CustomMaterialThemeColorConstant.dark.onSurface,
          ),
        ),
        body: Column(
          children: [
            addSeparator(height: 10.0),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DailyTasksScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: CustomMaterialThemeColorConstant.dark.surface5,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 5.0),
                              child: Text(
                                "Tägliche Aufgaben",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: CustomMaterialThemeColorConstant.dark.surface5,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return _buildSingleTask(
                                            index, dailyTaskList);
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            addSeparator(height: 10.0),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TasksScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: CustomMaterialThemeColorConstant.dark.surface5,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 5.0),
                              child: Text(
                                "Aufgaben",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: CustomMaterialThemeColorConstant.dark.surface5,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return _buildSingleTask(
                                            index, notDailyTaskList);
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            addSeparator(height: 10.0),
          ],
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
    if (index == 2) {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.black,
          ),
          Container(
            width: double.infinity,
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
            width: double.infinity,
            height: 2,
            color: Colors.black,
          ),
          Container(
            width: double.infinity,
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
