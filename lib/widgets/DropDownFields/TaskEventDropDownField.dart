import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer_app/controller/DropDownEventController.dart';
import 'package:organizer_app/core/model/Event.dart';

import '../../core/FireStoreFutures/GetObjects.dart';
import '../../core/model/Task.dart';
import '../../core/utils/materialThemeColorConstant.dart';

class TaskEventDropDownField extends StatelessWidget {

  final String? errorMessage;

  TaskEventDropDownField({
    Key? key,
    required this.task,
    this.errorMessage
  }) : super(key: key);
  final Task? task;

  final DropDownEventController eventController = Get.find();

  @override
  Widget build(BuildContext context) {
    if (task != null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: getEventOfTask(task!.event.id),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                if (kDebugMode) {
                  print(snapshot.error);
                }
              } else if (snapshot.hasData) {
                List<Event> list = snapshot.data!;
                // event.value = list[0];
                return Obx(
                  () => DropDownTextField(
                    dropDownIconProperty: IconProperty(
                        icon: Icons.arrow_drop_down,
                        color: CustomMaterialThemeColorConstant.dark.onSurface),
                    clearIconProperty: IconProperty(
                        icon: Icons.cancel_outlined,
                        color: CustomMaterialThemeColorConstant.dark.onSurface),
                    readOnly: true,
                    initialValue: eventController.event.value.title,
                    enableSearch: true,
                    listTextStyle: TextStyle(
                      color: CustomMaterialThemeColorConstant.dark.background,
                    ),
                    textStyle: TextStyle(
                      color: CustomMaterialThemeColorConstant.dark.onSurface,
                    ),
                    listSpace: 2,
                    textFieldDecoration: InputDecoration(
                      errorText: errorMessage,
                      hintText: "Event",
                      hintStyle: TextStyle(
                          color:
                              CustomMaterialThemeColorConstant.dark.onSurface),
                      filled: true,
                      fillColor:
                          CustomMaterialThemeColorConstant.dark.surfaceVariant,
                      label: Text(
                          style: TextStyle(
                              color: CustomMaterialThemeColorConstant
                                  .dark.onSurfaceVariant),
                          "Event"),
                    ),
                    onChanged: (dropDownValue) {
                      if(dropDownValue == "") {
                        eventController.changeEvent(taskEvent: Event(docRef: "", title: "", description: "", dateTime: DateTime.now()));
                      } else {
                        DropDownValueModel valueModel = dropDownValue;
                        eventController.changeEvent(taskEvent: valueModel.value);
                      }
                    },
                    dropDownList: list.map<DropDownValueModel>((doc) {
                      return DropDownValueModel(name: doc.title, value: doc);
                    }).toList(),
                  ),
                );
              }
              return CircularProgressIndicator();
            }),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: getEvents(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                if (kDebugMode) {
                  print(snapshot.error);
                }
              } else if (snapshot.hasData) {
                List<Event> list = snapshot.data!;
                return Obx(
                  () => DropDownTextField(
                    dropDownIconProperty: IconProperty(
                        icon: Icons.arrow_drop_down,
                        color: CustomMaterialThemeColorConstant.dark.onSurface),
                    clearIconProperty: IconProperty(
                        icon: Icons.cancel_outlined,
                        color: CustomMaterialThemeColorConstant.dark.onSurface),
                    readOnly: true,
                    initialValue: eventController.event.value.title,
                    enableSearch: true,
                    listTextStyle: TextStyle(
                      color: CustomMaterialThemeColorConstant.dark.background,
                    ),
                    textStyle: TextStyle(
                      color: CustomMaterialThemeColorConstant.dark.onSurface,
                    ),
                    listSpace: 2,
                    textFieldDecoration: InputDecoration(
                      errorText: errorMessage,
                      hintText: "Event",
                      hintStyle: TextStyle(
                          color:
                              CustomMaterialThemeColorConstant.dark.onSurface),
                      filled: true,
                      fillColor:
                          CustomMaterialThemeColorConstant.dark.surfaceVariant,
                      label: Text(
                          style: TextStyle(
                              color: CustomMaterialThemeColorConstant
                                  .dark.onSurfaceVariant),
                          "Event"),
                    ),
                    onChanged: (dropDownValue) {
                      if(dropDownValue == "") {
                        eventController.changeEvent(taskEvent: Event(docRef: "", title: "", description: "", dateTime: DateTime.now()));
                      } else {
                        DropDownValueModel valueModel = dropDownValue;
                        eventController.changeEvent(taskEvent: valueModel.value);
                      }
                    },
                    dropDownList: list.map<DropDownValueModel>((doc) {
                      return DropDownValueModel(name: doc.title, value: doc);
                    }).toList(),
                  ),
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
