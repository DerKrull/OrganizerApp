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
        isMainPage: false,
      ),
      backgroundColor: CustomMaterialThemeColorConstant.dark.surface5,
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
    return Card(
      color: CustomMaterialThemeColorConstant.dark.surface5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              taskList[index].name,
              style: taskList[index].done
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
              taskList[index].description,
              style: TextStyle(
                  fontSize: 16,
                  color: CustomMaterialThemeColorConstant.dark.onSurface),
            ),
            trailing: Text(
              " ${DateFormat("dd.MM.yyyy").format(taskList[index].dueDate)}",
              style: TextStyle(
                  fontSize: 16,
                  color: CustomMaterialThemeColorConstant.dark.onSurface),
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
                value: taskList[index].done,
                onChanged: (bool? value) {
                  setState(() {
                    taskList[index].done = !taskList[index].done;
                  });
                },
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TaskDetailScreen()));
            },
          ),
        ],
      ),
    );
  }
}
