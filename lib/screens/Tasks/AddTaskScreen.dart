import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer_app/controller/DateController.dart';
import 'package:organizer_app/controller/DropDownEventController.dart';
import 'package:organizer_app/controller/DropDownTaskCategoryController.dart';
import 'package:organizer_app/core/model/Event.dart';
import 'package:organizer_app/core/model/TaskCategory.dart';
import 'package:organizer_app/screens/TasksOverviewScreen.dart';
import 'package:organizer_app/widgets/CustomDatePicker.dart';
import 'package:organizer_app/widgets/CustomTextField.dart';
import 'package:organizer_app/widgets/CustomTopAppBar.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:organizer_app/widgets/DropDownFields/TaskCategoryDropDownField.dart';
import 'package:organizer_app/widgets/DropDownFields/TaskEventDropDownField.dart';

import '../../controller/Tasks/AddTaskController.dart';
import '../../core/app_export.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomButtons.dart';
import '../../widgets/ThreePointPopUpMenu.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);
  final RxInt selectedIndex = 0.obs;

  final DropDownTaskCategoryController ddtcController = Get.find();
  final AddTaskController addTaskController = Get.find();
  final DateController dateController = Get.find();
  final DropDownEventController taskEventController = Get.find();

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
    addTaskController.clearErrors();
    return Scaffold(
      appBar: CustomTopAppBar(
          title: "Aufgabe hinzufügen",
          showDelete: false,
          showThreePoints: false,
          menu: ThreePointPopUpMenu(
              onSelected: (int result) {}, entries: const []).build(context)),
      bottomNavigationBar: CustomBottomAppBar(
        mainPage: MainPages.TaskScreen,
        isMainPage: false,
      ),
      backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
      body: SingleChildScrollView(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: addTaskController.nameController,
                  errorMessage: addTaskController.nameError.value.isEmpty
                      ? null
                      : addTaskController.nameError.value,
                  label: 'Name',
                  hintText: 'Name der Aufgabe',
                ),
                buildSegmentedControl(),
                if (selectedIndex.value == 0) ...[
                  CustomDatePicker(label: "Datum"),
                ],
                TaskCategoryDropDownField(
                  task: null,
                ),
                if (selectedIndex.value == 0) ...[
                  CustomTextField(
                    controller: addTaskController.descriptionController,
                    label: 'Beschreibung',
                    hintText: 'Beschreibung',
                    errorMessage:
                        addTaskController.descriptionError.value.isEmpty
                            ? null
                            : addTaskController.descriptionError.value,
                  ),
                  TaskEventDropDownField(
                    task: null,
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
                              ddtcController.category.value;
                          String name = addTaskController.nameController.text;
                          String description =
                              addTaskController.descriptionController.text;
                          DateTime dueDate = dateController.actualDate;
                          bool isDaily =
                              selectedIndex.value == 1 ? true : false;
                          Event event = taskEventController.event.value;
                          addTaskController.clearErrors();
                          if (isDaily) {
                            if (name.isEmpty) {
                              addTaskController.displayError(
                                  name: "Name eingeben");
                            } else {
                              event = Event(
                                  title: "",
                                  description: "",
                                  dateTime: DateTime.now(),
                                  docRef: "1");
                              addTask(
                                  isDaily: isDaily,
                                  name: name,
                                  dueDate: DateTime.now(),
                                  description: "",
                                  done: false,
                                  taskCategory: taskCategory,
                                  event: event);
                              ddtcController.clear();
                              addTaskController.clear();
                              dateController.clear();
                              Navigator.of(context).pop();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TaskOverviewScreen()));
                            }
                          } else {
                            if (name.isEmpty) {
                              addTaskController.displayError(
                                  name: "Name eingeben");
                            } else if (description.isEmpty) {
                              addTaskController.displayError(
                                  description: "Beschreibung eingeben");
                            } else {
                              addTask(
                                  isDaily: isDaily,
                                  name: name,
                                  dueDate: dueDate,
                                  description: description,
                                  done: false,
                                  taskCategory: taskCategory,
                                  event: event);
                              ddtcController.clear();
                              addTaskController.clear();
                              dateController.clear();
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
      ),
    );
  }

  Widget buildSegmentedControl() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Obx(
          () => MaterialSegmentedControl(
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
