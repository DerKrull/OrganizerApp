import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:organizer_app/core/model/TaskCategory.dart';

import '../../../controller/Tasks/SingleTaskCategoryController.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/materialThemeColorConstant.dart';
import '../../../widgets/CustomBottomAppBar.dart';
import '../../../widgets/CustomReadOnlyTextField.dart';
import '../../../widgets/CustomTopAppBar.dart';
import '../../../widgets/ThreePointPopUpMenu.dart';
import 'EditTaskCategoryScreen.dart';

class ShowTaskCategoryScreen extends StatelessWidget {
  ShowTaskCategoryScreen({Key? key, required this.taskCategory}) : super(key: key);
  final TaskCategory taskCategory;

  final SingleTaskCategoryController singleTaskCategoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    singleTaskCategoryController.clearErrors();
    singleTaskCategoryController.nameController.text = taskCategory.name;
    return Scaffold(
      appBar: CustomTopAppBar(
          title: taskCategory.name,
          showDelete: false,
          showThreePoints: false,
          menu: ThreePointPopUpMenu(
              onSelected: (int result) {},
              entries: const ["Kategorie-Einstellungen"]).build(context)),
      bottomNavigationBar: CustomBottomAppBar(
          mainPage: MainPages.TaskScreen, isMainPage: false),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditTaskCategoryScreen(taskCategory: taskCategory)));
        },
        backgroundColor:
        CustomMaterialThemeColorConstant.dark.primaryContainer,
        child: Icon(
          Icons.edit,
          color: CustomMaterialThemeColorConstant.dark.onSurface,
        ),
      ),
      backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomReadOnlyTextField(
                  controller: singleTaskCategoryController.nameController,
                  label: "Name",
                ),
              ],
            )),
      ),
    );

  }
}
