import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:organizer_app/screens/Budget/BudgetCategoryScreen.dart';
import 'package:organizer_app/widgets/CustomTextField.dart';

import '../../controller/Budget/SingleCategoryController.dart';
import '../../controller/DropDownCategoryController.dart';
import '../../core/FireStoreFutures/DeleteObjects.dart';
import '../../core/app_export.dart';
import '../../core/model/BudgetCategory.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomButtons.dart';
import '../../widgets/CustomTopAppBar.dart';
import '../../widgets/ThreePointPopUpMenu.dart';
import '../BudgetScreen.dart';

class EditCategoryScreen extends StatelessWidget {
  EditCategoryScreen({Key? key, required this.category}) : super(key: key);
  final BudgetCategory category;

  final SingleCategoryController scController = Get.find();
  final DropDownCategoryController dropDownController = Get.find();

  @override
  Widget build(BuildContext context) {
    scController.clearErrors();
    return SafeArea(
      child: Scaffold(
          appBar: CustomTopAppBar(
              title: category.name,
              showThreePoints: false,
              showDelete: true,
              deleteOnPressed: () {
                deleteCategory(docRef: category.docRef);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => BudgetScreen()),
                );
              },
              menu: ThreePointPopUpMenu(
                  onSelected: (int result) {},
                  entries: const ["Kategorie-Einstellungen"]).build(context)),
          bottomNavigationBar: CustomBottomAppBar(
            mainPage: MainPages.BudgetScreen,
            isMainPage: false,
          ),
          backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
          body: FutureBuilder<BudgetCategory>(
              future: getBudgetCategory(category.docRef),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  if (kDebugMode) {
                    print(snapshot.error);
                  }
                } else if (snapshot.hasData) {
                  scController.nameController.text = snapshot.data!.name;
                  scController.descriptionController.text =
                      snapshot.data!.description;
                  scController.color.value = Color(snapshot.data!.color);
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
                                        child: Row(
                                          children: [
                                            buildColorPicker(context),
                                            Expanded(
                                              child: Padding(
                                                padding: getPadding(left: 20),
                                                child: CustomTextField(
                                                    hintText:
                                                        "Name der Kategorie",
                                                    controller: scController
                                                        .nameController,
                                                    label: "Name",
                                                    errorMessage: scController
                                                            .nameError
                                                            .value
                                                            .isEmpty
                                                        ? null
                                                        : scController
                                                            .nameError.value),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                          padding: getPadding(
                                              left: 20, right: 20, top: 20),
                                          child: CustomTextField(
                                            hintText: "Beschreibung",
                                            label: "Beschreibung",
                                            controller: scController
                                                .descriptionController,
                                            multiline: true,
                                            errorMessage: scController
                                                    .descriptionError
                                                    .value
                                                    .isEmpty
                                                ? null
                                                : scController
                                                    .descriptionError.value,
                                          )),
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
                                      String name =
                                          scController.nameController.text;
                                      String description = scController
                                          .descriptionController.text;
                                      Color selectedColor =
                                          scController.color.value;
                                      scController.clearErrors();
                                      if (name.isNotEmpty) {
                                        category.name = name;
                                        category.description = description;
                                        category.color = selectedColor.value;
                                        scController.clear();
                                        updateCategory(
                                            docRef: category.docRef,
                                            categoryName: name,
                                            categoryDescription: description,
                                            color: selectedColor.value);
                                        dropDownController.changeCategory(
                                            budgetCategory: category);
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BudgetCategoryScreen()),
                                        );
                                      } else {
                                        scController.clearErrors();
                                        if (name.isEmpty)
                                          scController.displayError(
                                              name: "Namen eingeben");
                                      }
                                    })
                                  ],
                                ),
                              ),
                            ],
                          )));
                }
                return const CircularProgressIndicator();
              })),
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor:
                      CustomMaterialThemeColorConstant.dark.secondaryContainer,
                  content: SingleChildScrollView(
                    child: HueRingPicker(
                        enableAlpha: false,
                        pickerColor: scController.color.value,
                        onColorChanged: scController.changeColor),
                  ),
                  actions: [
                    SaveButton(onPressed: () {
                      Navigator.of(context).pop(context);
                    })
                  ],
                );
              });
        },
        child: Obx(
          () => CircleAvatar(
              backgroundColor: scController.color.value, radius: getSize(25)),
        ));
  }
}
