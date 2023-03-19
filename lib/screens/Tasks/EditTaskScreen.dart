import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer_app/controller/DateController.dart';
import 'package:organizer_app/controller/DropDownTaskCategoryController.dart';
import 'package:organizer_app/controller/Tasks/SingleTaskController.dart';
import 'package:organizer_app/core/model/Event.dart';
import 'package:organizer_app/core/model/Task.dart';
import 'package:organizer_app/core/model/TaskCategory.dart';
import 'package:organizer_app/widgets/CustomDatePicker.dart';
import 'package:organizer_app/widgets/CustomTextField.dart';
import 'package:organizer_app/widgets/CustomTopAppBar.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:organizer_app/widgets/DropDownFields/TaskEventDropDownField.dart';

import '../../controller/DropDownEventController.dart';
import '../../core/app_export.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomButtons.dart';
import '../../widgets/DropDownFields/TaskCategoryDropDownField.dart';
import '../../widgets/ThreePointPopUpMenu.dart';

class EditTaskScreen extends StatelessWidget {
  EditTaskScreen({Key? key, required this.task}) : super(key: key);
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
    return Obx(() {
      taskController.clearErrors();
      taskController.nameController.text = task.name;
      taskController.descriptionController.text = task.description;
      taskDueDateController.updateSelectedDate(newDate: task.dueDate);
      selectedIndex.value = (task.isDaily) ? 1 : 0;
      //TODO: How to fill DropDowns init Value?
      return Scaffold(
        appBar: CustomTopAppBar(
            title: task.name,
            showDelete: false,
            showThreePoints: true,
            menu: ThreePointPopUpMenu(
                onSelected: (int result) {},
                entries: const ["Kategorie-Einstellungen"]).build(context)),
        bottomNavigationBar: CustomBottomAppBar(
          mainPage: MainPages.TaskScreen,
          isMainPage: false,
        ),
        backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
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
                  errorMessage: taskController.valueError.value.isEmpty
                      ? null
                      : taskController.valueError.value,
                ),
                buildSegmentedControl(),
                if (selectedIndex.value == 0) ...[
                  CustomDatePicker(label: "Datum"),
                ],
                TaskCategoryDropDownField(task: task),
                if (selectedIndex.value == 0) ...[
                  CustomTextField(
                    controller: taskController.descriptionController,
                    label: 'Beschreibung',
                    hintText: 'Beschreibung',
                  ),
                  TaskEventDropDownField(),
                ],
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: getPadding(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: getPadding(right: 20, top: 10, bottom: 10),
                          child: AbortButton(onPressed: () {
                            Navigator.of(context).pop();
                          }),
                        ),
                        SaveButton(onPressed: () {
                          TaskCategory taskCategory =
                              taskCategoryController.category.value;
                          String name =
                              taskController.nameController.text;
                          String description =
                              taskController.descriptionController.text;
                          bool isDaily =
                          selectedIndex.value == 1
                              ? true
                              : false;
                          Event event = taskEventController.event.value;
                          if (isDaily) {
                            if (name.isNotEmpty) {
                              event = Event(
                                  title: "",
                                  description: "",
                                  dateTime: DateTime.now(),
                                  docRef: "1");
                              updateTask(
                                  isDaily: isDaily,
                                  name: name,
                                  dueDate: DateTime.now(),
                                  description: "",
                                  done: false,
                                  taskCategory: taskCategory,
                                  event: event,
                                  docRef: task.taskRef);
                              taskCategoryController.clear();
                              taskController.clear();
                              taskDueDateController.clear();
                            } else {
                              print("Values are null");
                            }
                          } else {
                            if (name.isNotEmpty && description.isNotEmpty) {
                              updateTask(
                                  isDaily: isDaily,
                                  name: name,
                                  dueDate: DateTime.now(),
                                  description: description,
                                  done: false,
                                  taskCategory: taskCategory,
                                  event: event,
                                  docRef: task.taskRef);
                              taskCategoryController.clear();
                              taskController.clear();
                              taskDueDateController.clear();
                              Navigator.of(context).pop(context);
                            } else {
                              print("Values are null");
                            }
                          }
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
    });
  }

  Widget buildSegmentedControl() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: MaterialSegmentedControl(
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
    );
  }
}
