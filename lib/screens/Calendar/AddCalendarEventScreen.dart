import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer_app/controller/Calendar/SingleEventController.dart';
import 'package:organizer_app/controller/DateController.dart';
import 'package:organizer_app/controller/TimeController.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/screens/CalendarMonthScreen.dart';
import 'package:organizer_app/widgets/CustomBottomAppBar.dart';
import 'package:organizer_app/widgets/CustomDatePicker.dart';
import 'package:organizer_app/widgets/CustomTextField.dart';
import 'package:organizer_app/widgets/CustomTimePicker.dart';
import 'package:organizer_app/widgets/CustomTopAppBar.dart';

import '../../widgets/CustomButtons.dart';
import '../../widgets/ThreePointPopUpMenu.dart';

class AddCalendarEventScreen extends StatelessWidget {
  AddCalendarEventScreen({Key? key}) : super(key: key);

  final SingleEventController singleEventController = Get.find();
  final DateController dateController = Get.find();
  final TimeController timeController = Get.find();

  @override
  Widget build(BuildContext context) {
    singleEventController.clearErrors();
    //timeController.timeTextController.text = TimeOfDay.now().format(context);
    timeController.timeTextController.text = "";
    dateController.dateTextController.text = "";
    return Scaffold(
        appBar: CustomTopAppBar(
            title: "Termin hinzufügen",
            showDelete: false,
            showThreePoints: false,
            menu: ThreePointPopUpMenu(
                onSelected: (int result) {},
                entries: const ["Kategorie-Einstellungen"]).build(context)),
        bottomNavigationBar: CustomBottomAppBar(
            mainPage: MainPages.CalendarScreen, isMainPage: false),
        backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => Column(
                  children: [
                    CustomTextField(
                      controller: singleEventController.titleController,
                      label: "Titel",
                      hintText: "Titel des Termins",
                      errorMessage:
                          singleEventController.titleError.value.isEmpty
                              ? null
                              : singleEventController.titleError.value,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomDatePicker(label: "Datum wählen"),
                    /* Possible Category selection */
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTimePicker(label: "Zeit wählen"),
                    CustomTextField(
                      controller: singleEventController.descriptionController,
                      label: 'Beschreibung',
                      hintText: 'Beschreibung',
                      errorMessage:
                          singleEventController.descriptionError.value.isEmpty
                              ? null
                              : singleEventController.descriptionError.value,
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
                            String title =
                                singleEventController.titleController.text;
                            String description = singleEventController
                                .descriptionController.text;
                            DateTime date = dateController.actualDate;
                            TimeOfDay time = timeController.actualTime;
                            DateTime dateTime = DateTime(date.year, date.month,
                                date.day, time.hour, time.minute);
                            if (title.isNotEmpty) {
                              singleEventController.clearErrors();
                              addEvent(
                                title: title,
                                description: description,
                                dateTime: dateTime,
                              );
                              singleEventController.clear();
                              dateController.clear();
                              timeController.clear();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CalendarMonthScreen()));
                            } else {
                              singleEventController.clearErrors();
                              if (title.isEmpty) {
                                singleEventController.displayError(
                                    title: "Titel eingeben");
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
