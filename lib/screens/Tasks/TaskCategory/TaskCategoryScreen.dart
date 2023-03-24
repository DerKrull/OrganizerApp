import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/core/model/TaskCategory.dart';
import 'package:organizer_app/screens/Tasks/TaskCategory/AddTaskCategoryScreen.dart';
import 'package:organizer_app/screens/Tasks/TaskCategory/ShowTaskCategoryScreen.dart';

import '../../../core/utils/materialThemeColorConstant.dart';
import '../../../widgets/CustomBottomAppBar.dart';
import '../../../widgets/CustomTopAppBar.dart';
import '../../../widgets/ThreePointPopUpMenu.dart';

class TaskCategoryScreen extends StatelessWidget {
  const TaskCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
          title: "Tägliche Aufgaben",
          showDelete: false,
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
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddTaskCategoryController()));
        },
        backgroundColor: CustomMaterialThemeColorConstant.dark.primaryContainer,
        child: Icon(
          Icons.add,
          color: CustomMaterialThemeColorConstant.dark.onSurface,
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: getTaskCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final entry = snapshot.data![index];
                          return _buildSingleTaskCategory(
                              index, snapshot.data!, entry, context);
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

  Widget _buildSingleTaskCategory(int index, List<TaskCategory> taskCategories,
      TaskCategory entry, BuildContext context) {
    return Card(
      color: CustomMaterialThemeColorConstant.dark.surface5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              taskCategories[index].name,
              style: TextStyle(
                fontSize: 20,
                color: CustomMaterialThemeColorConstant.dark.onSurface,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShowTaskCategoryScreen(
                        taskCategory: entry,
                      )));
            },
          )
        ],
      ),
    );
  }
}
