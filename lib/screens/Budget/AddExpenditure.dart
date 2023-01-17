import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../core/model/BudgetCategory.dart';
import '../../widgets/BudgetCategoryDropDownField.dart';
import '../../widgets/CustomDatePicker.dart';
import '../../widgets/CustomTopAppBar.dart';
import '../../controller/SingleExpenditureController.dart';
import '../../core/app_export.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomButtons.dart';
import '../../widgets/CustomTextField.dart';
import '../../widgets/ThreePointPopUpMenu.dart';
import '../../widgets/CustomNumberField.dart';

class AddExpenditure extends StatelessWidget {
  AddExpenditure({Key? key}) : super(key: key);


  final SingleExpenditureController seController = Get.find();

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
        isMainPage: false,
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
                        String title = seController.titleController.text;
                        String description = seController.descriptionController.text;
                        double value = double.parse(seController.valueController.text);
                        BudgetCategory category = seController.category.value;
                        String date = seController.dateTextController.text;
                        print("""This is your data:
                        title:        ${title}
                        category:     ${category.name}
                        value:        ${value}
                        date:         ${date}
                        description:  ${description}
                        """);
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
