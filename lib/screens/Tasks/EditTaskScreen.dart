import 'package:flutter/material.dart';
import 'package:organizer_app/widgets/CustomTopAppBar.dart';

import '../../core/app_export.dart';
import '../../core/constants/constants.dart';
import '../../core/utils/materialThemeColorConstant.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomButtons.dart';
import '../../widgets/ThreePointPopUpMenu.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({Key? key}) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {

  String name = "";
  bool isDaily = false;
  DateTime dueDate = DateTime(0);
  String description = "";

  // TaskCategory taskCategory;
  String category = "";

  // Meeting meeting;
  String meeting = "";

  var nameController = TextEditingController();
  var isDailyController = TextEditingController();
  var dueDateController = TextEditingController();
  var descriptionController = TextEditingController();

  var categoryController = TextEditingController();
  var meetingController = TextEditingController();

  int _currentSelectionSegmentedControl = 0;
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
  void initState() {
    super.initState();
    nameController.addListener(() {
      name = nameController.text;
    });
    isDailyController.addListener(() {
      isDaily = isDailyController.value as bool;
    });
    dueDateController.addListener(() {
      dueDate = dueDateController.value as DateTime;
    });
    descriptionController.addListener(() {
      description = descriptionController.text;
    });
    categoryController.addListener(() {
      category = categoryController.text;
    });
    meetingController.addListener(() {
      meeting = meetingController.text;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    isDailyController.dispose();
    dueDateController.dispose();
    descriptionController.dispose();
    categoryController.dispose();
    meetingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
          title: "Aufgabe bearbeiten",
          showThreePoints: true,
          menu: ThreePointPopUpMenu(
              onSelected: (int result) {},
              entries: const ["Kategorie-Einstellungen"]).build(context)),
      bottomNavigationBar: CustomBottomAppBar(
        mainPage: MainPages.TaskScreen,
        currentPage: CurrentPages.TaskEditScreen,
      ),
      backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildTextField(
                controller: nameController,
                onChangedVar: name,
                label: 'Name',
                hintText: 'Name der Aufgabe',
              ),
              buildSegmentedControl(),
              buildTextField(
                  controller: dueDateController,
                  onChangedVar: dueDate,
                  label: 'Fälligkeitstermin',
                  hintText: 'dd.MM.yyyy'),
              buildTextField(
                controller: categoryController,
                onChangedVar: category,
                label: 'Kategorie',
                hintText: 'Name der Kategorie',
              ),
              buildTextField(
                controller: descriptionController,
                onChangedVar: description,
                label: 'Beschreibung',
                hintText: 'Beschreibung',
              ),
              buildTextField(
                controller: meetingController,
                onChangedVar: meeting,
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
                        if (name != "" && isDaily != null && dueDate != "" && description != "" && meeting != "" && meeting != "") {
                          // addCategory(color: selectedColor!.value, categoryName: categoryName!, categoryDescription: categoryDescription);
                          print("SAVE");
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
        child: MaterialSegmentedControl(
          children: _children,
          selectionIndex: _currentSelectionSegmentedControl,
          selectedColor: Color.fromARGB(255, 74, 68, 88),
          unselectedColor: CustomMaterialThemeColorConstant.dark.surface1,
          borderColor: CustomMaterialThemeColorConstant.dark.outline,

          onSegmentChosen: (index) {
            setState(() {
              _currentSelectionSegmentedControl = index;
            });
          },
        ),
      ),
    );
  }

  Widget buildTextField(
      {required controller,
        required onChangedVar,
        required String label,
        required String hintText,
        bool multiline = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autofocus: false,
        keyboardType: multiline ? TextInputType.multiline : TextInputType.name,
        minLines: 1,
        maxLines: 10,
        controller: controller,
        style: TextStyle(
          color: CustomMaterialThemeColorConstant.dark.onSurface,
        ),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: CustomMaterialThemeColorConstant.dark.onSurface),
            filled: true,
            fillColor: CustomMaterialThemeColorConstant.dark.surfaceVariant,
            label: Text(
                style: TextStyle(
                    color:
                    CustomMaterialThemeColorConstant.dark.onSurfaceVariant),
                label),
            suffixIcon: IconButton(
              icon: Icon(Icons.cancel_outlined),
              color: CustomMaterialThemeColorConstant.dark.onSurface,
              onPressed: () {
                controller.clear();
              },
            )),
      ),
    );
  }

}
