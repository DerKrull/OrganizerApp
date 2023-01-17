import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:organizer_app/core/FireStoreFutures/GetObjects.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/core/constants/constants.dart';
import 'package:organizer_app/core/model/BudgetCategory.dart';
import 'package:organizer_app/widgets/CustomBottomAppBar.dart';
import 'package:organizer_app/widgets/CustomTopAppBar.dart';
import 'package:organizer_app/widgets/CustomButtons.dart';
import 'package:organizer_app/widgets/ThreePointPopUpMenu.dart';

class EditCategoryScreen extends StatefulWidget {
  EditCategoryScreen({Key? key, this.categoryRef, this.initalName})
      : super(key: key);
  final categoryRef;
  final initalName;

  @override
  State<EditCategoryScreen> createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  Color? selectedColor;
  String? categoryName;
  String categoryDescription = "";

  var nameController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    categoryName = widget.initalName;
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
              title: categoryName!,
              showThreePoints: false,
              menu: ThreePointPopUpMenu(
                  onSelected: (int result) {},
                  entries: ["Kategorie-Einstellungen"]).build(context)),
          bottomNavigationBar: CustomBottomAppBar(
            mainPage: MainPages.BudgetScreen,
            currentPage: CurrentPages.budget.BudgetEditCategoryScreen,
          ),
          backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
          body: FutureBuilder<BudgetCategory>(
              future: getBudgetCategory(widget.categoryRef),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                } else if (snapshot.hasData) {
                  categoryName = snapshot.data!.name;
                  categoryDescription = snapshot.data!.description;
                  selectedColor ??= Color(snapshot.data!.color);
                  nameController.text = categoryName!;
                  descriptionController.text = categoryDescription;
                  return Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: getPadding(
                                top: 20, left: 20, right: 20, bottom: 10),
                            child: Row(
                              children: [
                                buildColorPicker(context),
                                Expanded(
                                  child: Padding(
                                    padding: getPadding(left: 20),
                                    child: buildTextField(
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
                              padding:
                                  getPadding(right: 20, top: 10, bottom: 10),
                              child: AbortButton(onPressed: () {
                                Navigator.of(context).pop();
                              }),
                            ),
                            SaveButton(onPressed: () {
                              if (categoryName != null &&
                                  selectedColor != null) {
                                updateCategory(
                                    docRef: widget.categoryRef,
                                    categoryName: categoryName!,
                                    categoryDescription: categoryDescription,
                                    color: selectedColor!.value);
                                Navigator.of(context).pop(context);
                              } else {
                                print("Values are null");
                              }
                            })
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return CircularProgressIndicator();
              })),
    );
  }

  Widget buildTextField(
      {required controller,
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
