import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:organizer_app/widgets/CustomTextField.dart';

import '../../core/app_export.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomTopAppBar.dart';
import '../../widgets/CustomButtons.dart';
import '../../widgets/ThreePointPopUpMenu.dart';

class AddCategoryScreen extends StatefulWidget {
  AddCategoryScreen({Key? key}) : super(key: key);
  final Color initialColor =
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  Color? selectedColor;
  String? categoryName;
  String categoryDescription = "";

  var nameController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedColor = widget.initialColor;
    nameController.addListener(() {
      categoryName = nameController.text;
    });
    descriptionController.addListener(() {
      categoryDescription = descriptionController.text;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void changeColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

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
            mainPage: MainPages.BudgetScreen, isMainPage: false,
          ),
          backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
          body: Stack(
            children: [
              Column(
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
                                controller: nameController,
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
                          controller: descriptionController,
                          multiline: true)),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
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
                      if (categoryName != null && selectedColor != null) {
                        addCategory(
                            color: selectedColor!.value,
                            categoryName: categoryName!,
                            categoryDescription: categoryDescription);
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
            ],
          )),
    );
  }

  GestureDetector buildColorPicker(BuildContext context) {
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
                      pickerColor: selectedColor!,
                      onColorChanged: changeColor),
                ),
                actions: [
                  SaveButton(onPressed: () {
                    setState(() {
                      categoryDescription = categoryDescription;
                      categoryName = categoryName;
                    });
                    Navigator.of(context).pop(context);
                  })
                ],
              );
            });
      },
      child: CircleAvatar(backgroundColor: selectedColor!, radius: getSize(25)),
    );
  }
}
