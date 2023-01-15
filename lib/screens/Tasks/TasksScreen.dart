import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/screens/Tasks/TaskDetailScreen.dart';
import 'package:organizer_app/widgets/CustomBottomAppBar.dart';

import '../../core/model/Task.dart';
import '../../widgets/CustomTopAppBar.dart';
import '../../widgets/ThreePointPopUpMenu.dart';
import 'AddTaskScreen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List<Task> taskList = <Task>[
    Task(false, "Task 1", DateTime(2022, 1, 20), "Meeting 1", false),
    Task(false, "Task 2", DateTime(2022, 1, 21), "Meeting 2", false),
    Task(false, "Task 3", DateTime(2022, 1, 22), "Meeting 3", false),
    Task(false, "Task 3", DateTime(2022, 1, 22), "Meeting 3", false),
    Task(false, "Task 3", DateTime(2022, 1, 22), "Meeting 3", false),
    Task(false, "Task 3", DateTime(2022, 1, 22), "Meeting 3", false),
    Task(false, "Task 3", DateTime(2022, 1, 22), "Meeting 3", false),
    Task(false, "Task 3", DateTime(2022, 1, 22), "Meeting 3", false),
    Task(false, "Task 3", DateTime(2022, 1, 22), "Meeting 3", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
          title: "Aufgaben",
          showThreePoints: true,
          menu: ThreePointPopUpMenu(
              onSelected: (int result) {},
              entries: const ["Kategorie-Einstellungen"]).build(context)),
      bottomNavigationBar: CustomBottomAppBar(
        mainPage: MainPages.TaskScreen,
      ),
      backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddTaskScreen()));
        },
        backgroundColor: CustomMaterialThemeColorConstant.dark.primaryContainer,
        child: Icon(
          Icons.add,
          color: CustomMaterialThemeColorConstant.dark.onSurface,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return _buildSingleTask(index, taskList);
                }),
          )
        ],
      ),
    );
  }

  Widget _buildSingleTask(int index, List<Task> taskList) {
    if(index == taskList.length - 1) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TaskDetailScreen()));
        },
        child: Column(
          children: [
            SingleChildScrollView(
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    // TODO Change color of checkbox
                    child: Checkbox(
                      shape: const CircleBorder(),
                      checkColor: Colors.white,
                      activeColor: CustomMaterialThemeColorConstant.light.primary,
                      value: taskList[index].done,
                      onChanged: (bool? value) {
                        setState(() {
                          taskList[index].done = !taskList[index].done;
                        });
                      },
                    ),
                  ),
                  Text(
                    taskList[index].name,
                    style: taskList[index].done
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
                          " ${DateFormat("dd.MM.yyyy").format(taskList[index].dueDate)}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          taskList[index].description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TaskDetailScreen()));
        },
        child: Column(
          children: [
            SingleChildScrollView(
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    // TODO Change color of checkbox
                    child: Checkbox(
                      shape: const CircleBorder(),
                      checkColor: Colors.white,
                      activeColor: CustomMaterialThemeColorConstant.light.primary,
                      value: taskList[index].done,
                      onChanged: (bool? value) {
                        setState(() {
                          taskList[index].done = !taskList[index].done;
                        });
                      },
                    ),
                  ),
                  Text(
                    taskList[index].name,
                    style: taskList[index].done
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
                          " ${DateFormat("dd.MM.yyyy").format(taskList[index].dueDate)}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          taskList[index].description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: CustomMaterialThemeColorConstant.dark.secondary,
            ),
          ],
        ),
      );
    }
  }
}
