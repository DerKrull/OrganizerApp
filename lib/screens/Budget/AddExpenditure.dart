import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:organizer_app/widgets/CustomTopAppBar.dart';

import '../../core/app_export.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomButtons.dart';
import '../../widgets/CustomTextField.dart';
import '../../widgets/ThreePointPopUpMenu.dart';
import '../../widgets/app_bar/CustomNumberField.dart';

class AddExpenditure extends StatefulWidget {
  const AddExpenditure({Key? key}) : super(key: key);

  @override
  State<AddExpenditure> createState() => _AddExpenditureState();
}

class _AddExpenditureState extends State<AddExpenditure> {
  String title = "";
  DateTime date = DateTime.now();
  String description = "";

  // BudgetCategory budgetCategory;
  String category = "";

  double value = 0;

  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var descriptionController = TextEditingController();

  var categoryController = TextEditingController();

  var valueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.addListener(() {
      title = titleController.text;
    });
    dateController.addListener(() {
      date = dateController.value as DateTime;
    });
    descriptionController.addListener(() {
      description = descriptionController.text;
    });
    categoryController.addListener(() {
      category = categoryController.text;
    });
    valueController.addListener(() {
      value = double.parse(valueController.text);
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    dateController.dispose();
    descriptionController.dispose();
    categoryController.dispose();
    valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(
          title: "Aufgabe hinzufügen",
          showThreePoints: true,
          menu: ThreePointPopUpMenu(
              onSelected: (int result) {},
              entries: const ["Kategorie-Einstellungen"]).build(context)),
      bottomNavigationBar: CustomBottomAppBar(isMainPage: false,
        mainPage: MainPages.TaskScreen,
      ),
      backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTextField(
                controller: titleController,
                label: 'Titel',
                hintText: 'Titel der Ausgabe',
              ),
              CustomTextField(
                  controller: dateController,
                  label: 'Datum',
                  hintText: 'dd.MM.yyyy'),
              CustomTextField(
                controller: categoryController,
                label: 'Kategorie',
                hintText: 'Name der Kategorie',
              ),
              CustomTextField(
                controller: descriptionController,
                label: 'Beschreibung',
                hintText: 'Beschreibung',
              ),
              CustomNumberField(
                controller: valueController,
                label: 'Betrag',
                hintText: 'Betrag der Ausgabe',
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
                        if (title != "" &&
                            description != "" &&
                            value != 0) {
                          // addCategory(color: selectedColor!.value, categoryName: categoryName!, categoryDescription: categoryDescription);
                          if (kDebugMode) {
                            print("SAVE");
                          }
                          Navigator.of(context).pop(context);
                        } else {
                          if (kDebugMode) {
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
  }
}


