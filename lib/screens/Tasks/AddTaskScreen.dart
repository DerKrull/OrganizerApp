import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:organizer_app/controller/DateController.dart';
import 'package:organizer_app/controller/DropDownEventController.dart';
import 'package:organizer_app/controller/DropDownTaskCategoryController.dart';
import 'package:organizer_app/controller/SegmentedControlController.dart';
import 'package:organizer_app/controller/Tasks/SingleTaskController.dart';
import 'package:organizer_app/core/model/Event.dart';
import 'package:organizer_app/core/model/TaskCategory.dart';
import 'package:organizer_app/widgets/CustomDatePicker.dart';
import 'package:organizer_app/widgets/CustomTextField.dart';
import 'package:organizer_app/widgets/CustomTopAppBar.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:organizer_app/widgets/DropDownFields/TaskCategoryDropDownField.dart';
import 'package:organizer_app/widgets/DropDownFields/TaskEventDropDownField.dart';

import '../../core/app_export.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomButtons.dart';
import '../../widgets/ThreePointPopUpMenu.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  final DropDownTaskCategoryController ddtcController = Get.find();
  final SingleTaskController singleTaskController = Get.find();
  // final TaskTypeController taskTypeController = Get.find();
  final DateController dateController = Get.find();
  final DropDownEventController taskEventController = Get.find();
  final SegmentedControlController segmentedControlController = Get.find();

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
    return Scaffold(
      appBar: CustomTopAppBar(
          title: "Aufgabe hinzufügen",
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
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: singleTaskController.nameController,
                  label: 'Name',
                  hintText: 'Name der Aufgabe',
                ),
                buildSegmentedControl(),
                if (segmentedControlController.selectedIndex.value == 0) ...[
                  CustomDatePicker(label: "Datum"),
                ],
                TaskCategoryDropDownField(),
                if (segmentedControlController.selectedIndex.value == 0) ...[
                  CustomTextField(
                    controller: singleTaskController.descriptionController,
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
                              ddtcController.category.value;
                          String name =
                              singleTaskController.nameController.text;
                          String description =
                              singleTaskController.descriptionController.text;
                          bool isDaily =
                          segmentedControlController.selectedIndex.value == 1
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
                              addTask(
                                  isDaily: isDaily,
                                  name: name,
                                  dueDate: DateTime.now(),
                                  description: "",
                                  done: false,
                                  taskCategory: taskCategory,
                                  event: event);
                              ddtcController.clear();
                              singleTaskController.clear();
                              dateController.clear();
                              // segmentedControlController.clear();
                            } else {
                              print("Values are null");
                            }
                          } else {
                            if (name.isNotEmpty && description.isNotEmpty) {
                              addTask(
                                  isDaily: isDaily,
                                  name: name,
                                  dueDate: DateTime.now(),
                                  description: description,
                                  done: false,
                                  taskCategory: taskCategory,
                                  event: event);
                              ddtcController.clear();
                              singleTaskController.clear();
                              dateController.clear();
                              // taskTypeController.clear();
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
            selectionIndex: segmentedControlController.selectedIndex.value,
            selectedColor: Color.fromARGB(255, 74, 68, 88),
            unselectedColor: CustomMaterialThemeColorConstant.dark.surface1,
            borderColor: CustomMaterialThemeColorConstant.dark.outline,
            onSegmentChosen: (index) {
              segmentedControlController.onIndexChange(index);
            },
          ),
        ),
      ),
    );
  }
}
