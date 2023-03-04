import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:organizer_app/controller/Budget/SingleCategoryController.dart';
import 'package:organizer_app/widgets/CustomTextField.dart';

import '../../core/app_export.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomTopAppBar.dart';
import '../../widgets/CustomButtons.dart';
import '../../widgets/ThreePointPopUpMenu.dart';

class AddCategoryScreen extends StatelessWidget {
  AddCategoryScreen({Key? key}) : super(key: key);

  final SingleCategoryController scController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomTopAppBar(
              title: "Add Category",
              showThreePoints: false,
              menu: ThreePointPopUpMenu(
                  onSelected: (int result) {},
                  entries: const ["Kategorie-Einstellungen"]).build(context)),
          bottomNavigationBar: CustomBottomAppBar(
            mainPage: MainPages.BudgetScreen,
            isMainPage: false,
          ),
          backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
          body: Column(
            children: [
              Padding(
                padding:
                    getPadding(top: 20, left: 20, right: 20, bottom: 10),
                child: Row(
                  children: [
                    buildColorPicker(context),
                    Expanded(
                      child: Padding(
                        padding: getPadding(left: 20),
                        child: CustomTextField(
                            hintText: "Name der Kategorie",
                            controller: scController.nameController,
                            label: "Name"),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: getPadding(left: 20, right: 20, top: 20),
                  child: CustomTextField(
                      hintText: "Beschreibung",
                      label: "Beschreibung",
                      controller: scController.descriptionController,
                      multiline: true)),
              Padding(
                padding: getPadding(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: getPadding(right: 20, top: 10, bottom: 10),
                      child: AbortButton(onPressed: () {
                        scController.clear();
                        Navigator.of(context).pop();
                      }),
                    ),
                    SaveButton(onPressed: () {
                      String name = scController.nameController.text;
                      String description =
                          scController.descriptionController.text;
                      Color color = scController.color.value;
                      print("""Controller Data:
  Name:         ${name}
  Description:  ${description}
  Color:        ${color}
                  """);
                      if (name.isNotEmpty) {
                        addCategory(
                            color: color.value,
                            categoryName: name,
                            categoryDescription: description);
                        scController.clear();
                        Navigator.of(context).pop(context);
                      } else {
                        print("no name set");
                      }
                    })
                  ],
                ),
              )
            ],
          )),
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
                    print("Controller after ${scController.color}");
                    Navigator.of(context).pop(context);
                  })
                ],
              );
            });
      },
      child: Obx(() => CircleAvatar(
          backgroundColor: scController.color.value, radius: getSize(25))),
    );
  }
}
