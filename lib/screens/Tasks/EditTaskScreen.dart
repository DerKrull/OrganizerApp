import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer_app/controller/DateController.dart';
import 'package:organizer_app/controller/DropDownTaskCategoryController.dart';
import 'package:organizer_app/controller/Tasks/SingleTaskController.dart';
import 'package:organizer_app/core/model/Event.dart';
import 'package:organizer_app/core/model/Task.dart';
import 'package:organizer_app/core/model/TaskCategory.dart';
import 'package:organizer_app/screens/TasksOverviewScreen.dart';
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
    if (taskController.nameError.value.isNotEmpty ||
        taskController.descriptionError.value.isNotEmpty) {
      taskController.clearErrors();
      taskController.nameController.text = task.name;
      taskController.descriptionController.text = task.description;
    } else if (taskEventController.eventError.value.isNotEmpty) {
      taskEventController.clearErrors();
    }
    taskCategoryController.clearErrors();
    taskDueDateController.updateSelectedDate(newDate: task.dueDate);
    selectedIndex.value = (task.isDaily) ? 1 : 0;
    return Obx(() {
      return Scaffold(
        appBar: CustomTopAppBar(
            title: task.name,
            showDelete: true,
            showThreePoints: false,
            deleteOnPressed: () {
              deleteTask(docRef: task.taskRef);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => TaskOverviewScreen()));
            },
            menu: ThreePointPopUpMenu(
                onSelected: (int result) {}, entries: const []).build(context)),
        bottomNavigationBar: CustomBottomAppBar(
          mainPage: MainPages.TaskScreen,
          isMainPage: false,
        ),
        backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: taskController.nameController,
                  label: 'Name',
                  hintText: 'Name der Aufgabe',
                  errorMessage: taskController.nameError.value.isEmpty
                      ? null
                      : taskController.nameError.value,
                ),
                buildSegmentedControl(),
                if (selectedIndex.value == 0) ...[
                  CustomDatePicker(label: "Datum"),
                ],
                TaskCategoryDropDownField(
                  task: task,
                  errorMessage:
                      taskCategoryController.categoryError.value.isEmpty
                          ? null
                          : taskCategoryController.categoryError.value,
                ),
                if (selectedIndex.value == 0) ...[
                  CustomTextField(
                    controller: taskController.descriptionController,
                    label: 'Beschreibung',
                    hintText: 'Beschreibung',
                    errorMessage: taskController.descriptionError.value.isEmpty
                        ? null
                        : taskController.descriptionError.value,
                  ),
                  TaskEventDropDownField(
                    task: task,
                    errorMessage: taskEventController.eventError.value.isEmpty
                        ? null
                        : taskEventController.eventError.value,
                  ),
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
                          String name = taskController.nameController.text;
                          String description =
                              taskController.descriptionController.text;
                          DateTime dueDate = taskDueDateController.actualDate;
                          bool isDaily =
                              selectedIndex.value == 1 ? true : false;
                          Event event = taskEventController.event.value;
                          taskController.clearErrors();
                          taskEventController.clearErrors();
                          taskCategoryController.clearErrors();
                          if (isDaily) {
                            if (name.isEmpty) {
                              taskController.displayError(
                                  name: "Name eingeben");
                            } else if (taskCategory.name.isEmpty) {
                              taskCategoryController.displayError(
                                  category: "Kategorie auswählen");
                            } else {
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
                              Navigator.of(context).pop();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TaskOverviewScreen()));
                            }
                          } else {
                            if (name.isEmpty) {
                              taskController.displayError(
                                  name: "Name eingeben");
                            } else if (description.isEmpty) {
                              taskController.displayError(
                                  description: "Beschreibung eingeben");
                            } else if (taskCategory.name.isEmpty) {
                              taskCategoryController.displayError(
                                  category: "Kategorie auswählen");
                            } else if (event.title.isEmpty) {
                              taskEventController.displayError(
                                  event: "Termin auswählen");
                            } else {
                              updateTask(
                                  isDaily: isDaily,
                                  name: name,
                                  dueDate: dueDate,
                                  description: description,
                                  done: false,
                                  taskCategory: taskCategory,
                                  event: event,
                                  docRef: task.taskRef);
                              taskCategoryController.clear();
                              taskController.clear();
                              taskDueDateController.clear();
                              Navigator.of(context).pop();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TaskOverviewScreen()));
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
