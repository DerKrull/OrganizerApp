import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer_app/controller/Tasks/SingleTaskCategoryController.dart';

import '../../../core/FireStoreFutures/AddObjects.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/materialThemeColorConstant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../widgets/CustomBottomAppBar.dart';
import '../../../widgets/CustomButtons.dart';
import '../../../widgets/CustomTextField.dart';
import '../../../widgets/CustomTopAppBar.dart';
import '../../../widgets/ThreePointPopUpMenu.dart';
import 'TaskCategoryScreen.dart';

class AddTaskCategoryController extends StatelessWidget {
  AddTaskCategoryController({Key? key}) : super(key: key);

  final SingleTaskCategoryController singleTaskCategoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    singleTaskCategoryController.clearErrors();
    return Scaffold(
        appBar: CustomTopAppBar(
            title: "Aufgaben Kategorie hinzufügen",
            showDelete: false,
            showThreePoints: false,
            menu: ThreePointPopUpMenu(
                onSelected: (int result) {},
                entries: const ["Kategorie-Einstellungen"]).build(context)),
        bottomNavigationBar: CustomBottomAppBar(
            mainPage: MainPages.TaskScreen, isMainPage: false),
        backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => Column(
              children: [
                CustomTextField(
                  controller: singleTaskCategoryController.nameController,
                  label: "Name",
                  hintText: "Name der Kategorie",
                  errorMessage:
                  singleTaskCategoryController.nameError.value.isEmpty
                      ? null
                      : singleTaskCategoryController.nameError.value,
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
                        String name =
                            singleTaskCategoryController.nameController.text;
                        if (name.isNotEmpty) {
                          singleTaskCategoryController.clearErrors();
                          addTaskCategory(
                            name: name,
                          );
                          singleTaskCategoryController.clear();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TaskCategoryScreen()));
                        } else {
                          singleTaskCategoryController.clearErrors();
                          if (name.isEmpty) {
                            singleTaskCategoryController.displayError(
                                title: "Name eingeben");
                          }
                        }
                      })
                    ],
                  ),
                )
              ],
            )),
          ),
        ));
  }
}
