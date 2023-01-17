import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../core/app_export.dart';
import '../../core/constants/constants.dart';
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
                  entries: ["Kategorie-Einstellungen"]).build(context)),
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
                            child: buildTextField(
                                onChangedVar: categoryName,
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
                      child: buildTextField(
                          onChangedVar: categoryDescription,
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
                        print("Values are null");
                      }
                    })
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget buildTextField(
      {required controller,
      required onChangedVar,
      required String label,
      required String hintText,
      bool multiline = false}) {
    return TextFormField(
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
          suffixIcon: IconButton(
            icon: Icon(Icons.cancel_outlined),
            color: CustomMaterialThemeColorConstant.dark.onSurface,
            onPressed: () {
              controller.clear();
            },
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
