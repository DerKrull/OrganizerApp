import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:organizer_app/screens/Tasks/EditTaskScreen.dart';

import '../../core/app_export.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomTopAppBar.dart';
import '../../widgets/ThreePointPopUpMenu.dart';

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({Key? key}) : super(key: key);

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
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
          title: "<<Name der Aufgabe>>",
          showThreePoints: true,
          menu: ThreePointPopUpMenu(
              onSelected: (int result) {},
              entries: const ["Kategorie-Einstellungen"]).build(context)),
      bottomNavigationBar: CustomBottomAppBar(
        mainPage: MainPages.TaskScreen,
        isMainPage: false,
      ),
      backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EditTaskScreen()));
        },
        backgroundColor: CustomMaterialThemeColorConstant.dark.primaryContainer,
        child: Icon(
          Icons.settings,
          color: CustomMaterialThemeColorConstant.dark.onSurface,
        ),
      ),
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
          hintStyle:
              TextStyle(color: CustomMaterialThemeColorConstant.dark.onSurface),
          filled: true,
          fillColor: CustomMaterialThemeColorConstant.dark.surfaceVariant,
          label: Text(
              style: TextStyle(
                  color:
                      CustomMaterialThemeColorConstant.dark.onSurfaceVariant),
              label),
        ),
      ),
    );
  }
}
