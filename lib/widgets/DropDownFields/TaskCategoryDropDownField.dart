import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer_app/controller/DropDownTaskCategoryController.dart';
import 'package:organizer_app/core/model/TaskCategory.dart';

import '../../core/FireStoreFutures/GetObjects.dart';
import '../../core/model/Task.dart';
import '../../core/utils/materialThemeColorConstant.dart';

class TaskCategoryDropDownField extends StatelessWidget {
  TaskCategoryDropDownField({
    Key? key,
    required this.task,
  }) : super(key: key);
  final Task? task;

  final DropDownTaskCategoryController taskCategoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    if(task != null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: getTaskCategoryOfTask(task!.taskCategory.id),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                if (kDebugMode) {
                  print(snapshot.error);
                }
              } else if (snapshot.hasData) {
                  List<TaskCategory> list = snapshot.data!;
                  taskCategoryController.changeCategory(taskCategory: list[0]);
                  return DropDownTextField(
                      dropDownIconProperty: IconProperty(
                          icon: Icons.arrow_drop_down,
                          color: CustomMaterialThemeColorConstant.dark.onSurface),
                      clearIconProperty: IconProperty(
                          icon: Icons.cancel_outlined,
                          color: CustomMaterialThemeColorConstant.dark.onSurface
                      ),
                      readOnly: true,
                      initialValue: taskCategoryController.category.value.name,
                      enableSearch: true,
                      listTextStyle: TextStyle(color: CustomMaterialThemeColorConstant.dark.background,),
                      textStyle: TextStyle(color: CustomMaterialThemeColorConstant.dark.onSurface,),
                      listSpace: 2,
                      textFieldDecoration: InputDecoration(
                        hintText: "Kategorie",
                        hintStyle: TextStyle(
                            color: CustomMaterialThemeColorConstant.dark.onSurface),
                        filled: true,
                        fillColor:
                        CustomMaterialThemeColorConstant.dark.surfaceVariant,
                        label: Text(
                            style: TextStyle(
                                color: CustomMaterialThemeColorConstant
                                    .dark.onSurfaceVariant),
                            "Kategorie"),
                      ),
                      onChanged: (dropDownValue) {
                        DropDownValueModel valueModel = dropDownValue;
                        taskCategoryController.changeCategory(taskCategory: valueModel.value);
                      },
                      dropDownList: list.map<DropDownValueModel>((doc) {
                        return DropDownValueModel(name: doc.name, value: doc);
                      }).toList(),
                );
              }
              return CircularProgressIndicator();
            }),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: getTaskCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                if (kDebugMode) {
                  print(snapshot.error);
                }
              } else if (snapshot.hasData) {
                  List<TaskCategory> list = snapshot.data!;
                  taskCategoryController.changeCategory(taskCategory: list[0]);
                  return DropDownTextField(
                      dropDownIconProperty: IconProperty(
                          icon: Icons.arrow_drop_down,
                          color: CustomMaterialThemeColorConstant.dark.onSurface),
                      clearIconProperty: IconProperty(
                          icon: Icons.cancel_outlined,
                          color: CustomMaterialThemeColorConstant.dark.onSurface
                      ),
                      readOnly: true,
                      initialValue: taskCategoryController.category.value.name,
                      enableSearch: true,
                      listTextStyle: TextStyle(color: CustomMaterialThemeColorConstant.dark.background,),
                      textStyle: TextStyle(color: CustomMaterialThemeColorConstant.dark.onSurface,),
                      listSpace: 2,
                      textFieldDecoration: InputDecoration(
                        hintText: "Kategorie",
                        hintStyle: TextStyle(
                            color: CustomMaterialThemeColorConstant.dark.onSurface),
                        filled: true,
                        fillColor:
                        CustomMaterialThemeColorConstant.dark.surfaceVariant,
                        label: Text(
                            style: TextStyle(
                                color: CustomMaterialThemeColorConstant
                                    .dark.onSurfaceVariant),
                            "Kategorie"),
                      ),
                      onChanged: (dropDownValue) {
                        DropDownValueModel valueModel = dropDownValue;
                        taskCategoryController.changeCategory(taskCategory: valueModel.value);
                      },
                      dropDownList: list.map<DropDownValueModel>((doc) {
                        return DropDownValueModel(name: doc.name, value: doc);
                      }).toList(),
                  );
              }
              return CircularProgressIndicator();
            }),
      );
    }
  }

  TextStyle getTextStyle() {
    return TextStyle(
      color: CustomMaterialThemeColorConstant.dark.onSurface,
    );
  }
}
