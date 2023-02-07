import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:organizer_app/controller/DateController.dart';
import 'package:organizer_app/controller/DropDownTaskCategoryController.dart';
import 'package:organizer_app/controller/SingleTaskController.dart';
import 'package:organizer_app/controller/TaskTypeController.dart';
import 'package:organizer_app/core/model/TaskCategory.dart';
import 'package:organizer_app/widgets/CustomDatePicker.dart';
import 'package:organizer_app/widgets/CustomTextField.dart';
import 'package:organizer_app/widgets/CustomTopAppBar.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:organizer_app/widgets/TaskCategoryDropDownField.dart';

import '../../core/app_export.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomButtons.dart';
import '../../widgets/ThreePointPopUpMenu.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  final DropDownTaskCategoryController ddtcController = Get.find();
  final SingleTaskController singleTaskController = Get.find();
  final TaskTypeController taskTypeController = Get.find();
  final DateController dateController = Get.find();

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
                controller: singleTaskController.nameController,
                label: 'Name',
                hintText: 'Name der Aufgabe',
              ),
              buildSegmentedControl(),
              CustomDatePicker(label: "Datum"),
              TaskCategoryDropDownField(),
              CustomTextField(
                controller: singleTaskController.descriptionController,
                label: 'Beschreibung',
                hintText: 'Beschreibung',
              ),
              CustomTextField(
                controller: singleTaskController.meetingController,
                label: 'Termin',
                hintText: 'Name des Termins',
              ),
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
                        String name = singleTaskController.nameController.text;
                        String description = singleTaskController.descriptionController.text;
                        String meeting = singleTaskController.meetingController.text;
                        DateTime dueDate = dateController.actualDate;
                        bool isDaily = taskTypeController.currentSelected.value == 1 ? true : false;
                        if (name.isNotEmpty &&
                            description.isNotEmpty &&
                            meeting.isNotEmpty) {
                          print("SAVE");
                          //TODO: Implement add method to use the new stuff

                          print(dueDate);
                          print(taskCategory.name);
                          addTask(
                              isDaily: isDaily,
                              name: name,
                              dueDate: DateTime.now(),
                              description: description,
                              done: false,
                              taskCategory: taskCategory);
                          ddtcController.clear();
                          singleTaskController.clear();
                          dateController.clear();
                          taskTypeController.clear();
                          Navigator.of(context).pop(context);
                        } else {
                          print("Values are null");
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
  }

  Widget buildSegmentedControl() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Obx(
          () => MaterialSegmentedControl(
            children: _children,
            selectionIndex: taskTypeController.currentSelected.value,
            selectedColor: Color.fromARGB(255, 74, 68, 88),
            unselectedColor: CustomMaterialThemeColorConstant.dark.surface1,
            borderColor: CustomMaterialThemeColorConstant.dark.outline,
            onSegmentChosen: (index) {
              taskTypeController.changeCurrentSelected(index: index);
            },
          ),
        ),
      ),
    );
  }
}
