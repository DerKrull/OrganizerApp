import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/widgets/CustomBottomAppBar.dart';

import '../../core/model/Task.dart';
import '../../widgets/CustomTopAppBar.dart';
import '../../widgets/ThreePointPopUpMenu.dart';
import 'AddTaskScreen.dart';
import 'TaskDetailScreen.dart';

class DailyTasksScreen extends StatefulWidget {
  const DailyTasksScreen({Key? key}) : super(key: key);

  @override
  State<DailyTasksScreen> createState() => _DailyTasksScreenState();
}

class _DailyTasksScreenState extends State<DailyTasksScreen> {

  final List<Task> dailyTaskList = <Task>[
    Task(true, "Daily Task 1", DateTime(0), "", false),
    Task(true, "Daily Task 2", DateTime(0), "", false),
    Task(true, "Daily Task 3", DateTime(0), "", false),
    Task(true, "Daily Task 3", DateTime(0), "", false),
    Task(true, "Daily Task 3", DateTime(0), "", false),
    Task(true, "Daily Task 3", DateTime(0), "", false),
    Task(true, "Daily Task 3", DateTime(0), "", false),
    Task(true, "Daily Task 3", DateTime(0), "", false),
    Task(true, "Daily Task 3", DateTime(0), "", false),
    Task(true, "Daily Task 3", DateTime(0), "", false),
    Task(true, "Daily Task 3", DateTime(0), "", false),
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
                itemCount: dailyTaskList.length,
                itemBuilder: (context, index) {
                  return _buildSingleTask(index, dailyTaskList);
                }),
          )
        ],
      ),
    );
  }

  //TODO fix size of cards
  Widget _buildSingleTask(int index, List<Task> taskList) {
    if (index == taskList.length - 1) {
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
