import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/Budget/SingleExpenditureController.dart';
import '../../controller/DateController.dart';
import '../../controller/DropDownCategoryController.dart';
import '../../core/model/BudgetCategory.dart';
import '../../widgets/BudgetCategoryDropDownField.dart';
import '../../widgets/CustomDatePicker.dart';
import '../../widgets/CustomTopAppBar.dart';
import '../../core/app_export.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomButtons.dart';
import '../../widgets/CustomTextField.dart';
import '../../widgets/ThreePointPopUpMenu.dart';
import '../../widgets/CustomNumberField.dart';

class AddExpenditureScreen extends StatelessWidget {
  AddExpenditureScreen({Key? key}) : super(key: key);

  final SingleExpenditureController seController = Get.find();
  final DateController dateController = Get.find();
  final DropDownCategoryController ddcController = Get.find();

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
        isMainPage: false,
        mainPage: MainPages.TaskScreen,
      ),
      backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTextField(
                controller: seController.titleController,
                label: 'Titel',
                hintText: 'Titel der Ausgabe',
              ),
              CustomDatePicker(label: "Datum"),
              BudgetCategoryDropDownField(),
              CustomTextField(
                controller: seController.descriptionController,
                label: 'Beschreibung',
                hintText: 'Beschreibung',
              ),
              CustomNumberField(
                controller: seController.valueController,
                label: 'Betrag',
                hintText: 'Betrag der Ausgabe',
              ),
              Padding(
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
                      String title = seController.titleController.text;
                      String description =
                          seController.descriptionController.text;
                      String valueStr =
                          seController.valueController.text;
                      BudgetCategory category = ddcController.category.value;
                      String dateStr = dateController.dateTextController.text;
                      DateTime date = dateController.actualDate;
                      if(title.isNotEmpty && valueStr.isNotEmpty && dateStr.isNotEmpty ) {
                        double value = double.parse(valueStr);
                        addExpenditure(category: category, title: title, value: value, date: date, description: description);
                        seController.clear();
                        dateController.clear();
                        Navigator.of(context).pop();
                      } else {
                        print("Values are empty");
                      }
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
