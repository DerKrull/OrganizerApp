import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:organizer_app/screens/Budget/BudgetCategoryScreen.dart';
import 'package:organizer_app/widgets/CustomTextField.dart';

import '../../core/app_export.dart';
import '../../core/model/BudgetCategory.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomButtons.dart';
import '../../widgets/CustomTopAppBar.dart';
import '../../widgets/ThreePointPopUpMenu.dart';


class EditCategoryScreen extends StatefulWidget {
  EditCategoryScreen({Key? key, required this.category})
      : super(key: key);
  BudgetCategory category;

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
    categoryName = widget.category.name;
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
                  entries: const ["Kategorie-Einstellungen"]).build(context)),
          bottomNavigationBar: CustomBottomAppBar(
            mainPage: MainPages.BudgetScreen,
            isMainPage: false,
          ),
          backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
          body: FutureBuilder<BudgetCategory>(
              future: getBudgetCategory(widget.category.docRef),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  if (kDebugMode) {
                    print(snapshot.error);
                  }
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
                              padding:
                                  getPadding(right: 20, top: 10, bottom: 10),
                              child: AbortButton(onPressed: () {
                                Navigator.of(context).pop();
                              }),
                            ),
                            SaveButton(onPressed: () {
                              if (categoryName != null &&
                                  selectedColor != null) {
                                widget.category.name = categoryName!;
                                widget.category.description = categoryDescription;
                                widget.category.color = selectedColor!.value;
                                updateCategory(
                                    docRef: widget.category.docRef,
                                    categoryName: categoryName!,
                                    categoryDescription: categoryDescription,
                                    color: selectedColor!.value);
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BudgetCategoryScreen(initialDate: DateTime.now(), category: widget.category)));
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
                  );
                }
                return const CircularProgressIndicator();
              })),
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
