import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:organizer_app/controller/Budget/SingleBudgetController.dart';
import 'package:organizer_app/controller/MonthController.dart';
import 'package:organizer_app/widgets/CustomTextField.dart';

import '../../controller/DropDownCategoryController.dart';
import '../../core/app_export.dart';
import '../../core/model/Budget.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomButtons.dart';
import '../../widgets/CustomTopAppBar.dart';
import '../../widgets/ThreePointPopUpMenu.dart';
import '../BudgetScreen.dart';

class EditBudgetScreen extends StatelessWidget {
  EditBudgetScreen({Key? key}) : super(key: key);

  final SingleBudgetController bgController = Get.find();
  final DropDownCategoryController dropDownController = Get.find();
  final MonthController monthController = Get.find();
  final format = DateFormat("MMMM", "de_DE");

  @override
  Widget build(BuildContext context) {
    bgController.clearErrors();
    return SafeArea(
      child: Scaffold(
          appBar: CustomTopAppBar(
              title:
                  "Budget - ${format.format(monthController.actualMonth.value)}",
              showDelete: false,
              showThreePoints: false,
              menu: ThreePointPopUpMenu(
                  onSelected: (int result) {},
                  entries: const ["Kategorie-Einstellungen"]).build(context)),
          bottomNavigationBar: CustomBottomAppBar(
            mainPage: MainPages.BudgetScreen,
            isMainPage: false,
          ),
          backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
          body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: getBudget(monthController.actualMonth.value),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  if (kDebugMode) {
                    print(snapshot.error);
                  }
                } else if (snapshot.hasData) {
                  Budget budget =
                      Budget.fromDocumentSnapshot(doc: snapshot.data!);
                  bgController.valueController.text = budget.value.toString();
                  bgController.descriptionController.text = budget.description;
                  return SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Obx(() => Column(
                                    children: [
                                      Padding(
                                        padding: getPadding(
                                            top: 20,
                                            left: 20,
                                            right: 20,
                                            bottom: 10),
                                        child: CustomTextField(
                                          hintText:
                                              "Betrag für den aktuellen Monat",
                                          controller:
                                              bgController.valueController,
                                          label: "Betrag",
                                          errorMessage: bgController
                                                  .valueError.value.isEmpty
                                              ? null
                                              : bgController.valueError.value,
                                        ),
                                      ),
                                      Padding(
                                          padding: getPadding(
                                              left: 20, right: 20, top: 20),
                                          child: CustomTextField(
                                              hintText: "Beschreibung",
                                              label: "Beschreibung",
                                              controller: bgController
                                                  .descriptionController,
                                              multiline: true,)),
                                    ],
                                  )),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                          right: 20, top: 10, bottom: 10),
                                      child: AbortButton(onPressed: () {
                                        Navigator.of(context).pop();
                                      }),
                                    ),
                                    SaveButton(onPressed: () {
                                      String tmp =
                                          bgController.valueController.text;
                                      String description = bgController
                                          .descriptionController.text;
                                      if (tmp.isNotEmpty) {
                                        double value = double.parse(tmp);
                                        bgController.clearErrors();
                                        updateBudget(
                                            date: monthController
                                                .actualMonth.value,
                                            description: description,
                                            value: value,
                                            docRef: snapshot.data!.id);
                                        bgController.clear();
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BudgetScreen()),
                                        );
                                      } else {
                                        bgController.clearErrors();
                                        if (tmp.isEmpty)
                                          bgController.displayError(
                                              value: "Betrag eingeben");
                                      }
                                    })
                                  ],
                                ),
                              ),
                            ],
                          )));
                }
                return SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Obx(() => Column(
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                          top: 20,
                                          left: 20,
                                          right: 20,
                                          bottom: 10),
                                      child: CustomTextField(
                                        hintText:
                                            "Betrag für den aktuellen Monat",
                                        controller:
                                            bgController.valueController,
                                        label: "Betrag",
                                        errorMessage: bgController
                                                .valueError.value.isEmpty
                                            ? null
                                            : bgController.valueError.value,
                                      ),
                                    ),
                                    Padding(
                                        padding: getPadding(
                                            left: 20, right: 20, top: 20),
                                        child: CustomTextField(
                                            hintText: "Beschreibung",
                                            label: "Beschreibung",
                                            controller: bgController
                                                .descriptionController,
                                            multiline: true)),
                                  ],
                                )),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                        right: 20, top: 10, bottom: 10),
                                    child: AbortButton(onPressed: () {
                                      Navigator.of(context).pop();
                                    }),
                                  ),
                                  SaveButton(onPressed: () {
                                    String tmp =
                                        bgController.valueController.text;

                                    String description =
                                        bgController.descriptionController.text;
                                    if (tmp.isNotEmpty) {
                                      bgController.clearErrors();
                                      double value = double.parse(tmp);
                                      addBudget(
                                        date: monthController.actualMonth.value,
                                        description: description,
                                        value: value,
                                      );
                                      bgController.clear();
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BudgetScreen()),
                                      );
                                    } else {
                                      bgController.clearErrors();
                                      if (tmp.isEmpty)
                                        bgController.displayError(
                                            value: "Betrag eingeben");
                                    }
                                  })
                                ],
                              ),
                            ),
                          ],
                        )));
              })),
    );
  }
}
