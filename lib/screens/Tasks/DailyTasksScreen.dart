import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/widgets/CustomBottomAppBar.dart';

import '../../core/FireStoreFutures/GetTasksFutures.dart';
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
  Stream<List<Task>> tasksStream() {
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
          StreamBuilder(
              stream: tasksStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return _buildSingleTask(index, snapshot.data!);
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const Center(child: CircularProgressIndicator());
              })
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
                    changeDone(taskList, index);
                  });
                },
              ),
            ),
            subtitle: FutureBuilder(
              future: getTaskCategoryName(taskList[index].taskCategory.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "${snapshot.data?.name}",
                    style: TextStyle(
                        color: CustomMaterialThemeColorConstant.dark.onSurface,
                        fontSize: 16),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              },
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

  void changeDone(List<Task> isCheckedList, int index) {
    isCheckedList[index].done = !isCheckedList[index].done;
    updateTask(
        docRef: isCheckedList[index].taskRef,
        description: isCheckedList[index].description,
        done: isCheckedList[index].done,
        dueDate: isCheckedList[index].dueDate,
        isDaily: isCheckedList[index].isDaily,
        name: isCheckedList[index].name,
        taskCategory: isCheckedList[index].taskCategory);
  }
}
