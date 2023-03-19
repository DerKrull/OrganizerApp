import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:organizer_app/widgets/CustomDatePicker.dart';
import 'package:organizer_app/widgets/CustomTextField.dart';

import '../../controller/DateController.dart';
import '../../controller/DropDownEventController.dart';
import '../../controller/DropDownTaskCategoryController.dart';
import '../../controller/Tasks/SingleTaskController.dart';
import '../../core/app_export.dart';
import '../../core/model/Task.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomTopAppBar.dart';
import '../../widgets/DropDownFields/TaskCategoryDropDownField.dart';
import '../../widgets/DropDownFields/TaskEventDropDownField.dart';
import '../../widgets/ThreePointPopUpMenu.dart';
import 'EditTaskScreen.dart';

class TaskDetailScreen extends StatelessWidget {
  TaskDetailScreen({Key? key, required this.task}) : super(key: key);
  final Task task;
  final RxInt selectedIndex = 0.obs;

  final SingleTaskController taskController = Get.find();
  final DropDownTaskCategoryController taskCategoryController = Get.find();
  final DropDownEventController taskEventController = Get.find();
  final DateController taskDueDateController = Get.find();

  final Map<int, Widget> _children = {
    0: const Text(
      "Normal",
      style: TextStyle(color: Colors.white),
    ),
    1: const Text(
      "Tägliche",
      style: TextStyle(color: Colors.white),
    ),
  };

  @override
  Widget build(BuildContext context) {
    taskController.clearErrors();
    taskController.nameController.text = task.name;
    taskController.descriptionController.text = task.description;
    taskDueDateController.updateSelectedDate(newDate: task.dueDate);
    selectedIndex.value = (task.isDaily) ? 1 : 0;
    // segmentedControlController.onIndexChange((task.isDaily) ? 1 : 0);
    //TODO: How to fill DropDowns init Value?
    return Scaffold(
      appBar: CustomTopAppBar(
          title: task.name,
          showDelete: false,
          showThreePoints: true,
          menu: ThreePointPopUpMenu(
              onSelected: (int result) {
                deleteTask(docRef: task.taskRef);
                Navigator.of(context).pop();
              },
              entries: const ["Aufgabe löschen"]).build(context)),
      bottomNavigationBar: CustomBottomAppBar(
        mainPage: MainPages.TaskScreen,
        isMainPage: false,
      ),
      backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditTaskScreen(
                    task: task,
                  )));
        },
        backgroundColor: CustomMaterialThemeColorConstant.dark.primaryContainer,
        child: Icon(
          Icons.edit,
          color: CustomMaterialThemeColorConstant.dark.onSurface,
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: taskController.nameController,
                  label: 'Name',
                  hintText: 'Name der Aufgabe',
                  enabled: false,
                ),
                buildSegmentedControl(),
                if (selectedIndex.value == 0) ...[
                  CustomDatePicker(label: "Datum"),
                ],
                TaskCategoryDropDownField(),
                if (selectedIndex.value == 0) ...[
                  CustomTextField(
                    controller: taskController.descriptionController,
                    label: 'Beschreibung',
                    hintText: 'Beschreibung',
                  ),
                  TaskEventDropDownField(),
                ],
              ],
            ),
          ),
        ),
    );
  }

  Widget buildSegmentedControl() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Obx(() => MaterialSegmentedControl(
            children: _children,
            selectionIndex: selectedIndex.value,
            selectedColor: Color.fromARGB(255, 74, 68, 88),
            unselectedColor: CustomMaterialThemeColorConstant.dark.surface1,
            borderColor: CustomMaterialThemeColorConstant.dark.outline,
            onSegmentChosen: (index) {
              selectedIndex.value = (selectedIndex.value == 0) ? 1 : 0;
            },
          ),
        ),
      ),
    );
  }
}
