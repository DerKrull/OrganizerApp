import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer_app/screens/Calendar/EditCalendarEventScreen.dart';

import '../../controller/Calendar/SingleEventController.dart';
import '../../controller/DateController.dart';
import '../../controller/TimeController.dart';
import '../../core/app_export.dart';
import '../../core/model/Event.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomDatePicker.dart';
import '../../widgets/CustomReadOnlyTextField.dart';
import '../../widgets/CustomTimePicker.dart';
import '../../widgets/CustomTopAppBar.dart';
import '../../widgets/ThreePointPopUpMenu.dart';

class ShowCalendarEventScreen extends StatelessWidget {
  ShowCalendarEventScreen({Key? key, required this.event}) : super(key: key);
  final Event event;

  final SingleEventController singleEventController = Get.find();
  final DateController dateController = Get.find();
  final TimeController timeController = Get.find();

  @override
  Widget build(BuildContext context) {
    singleEventController.clearErrors();
    singleEventController.titleController.text = event.title;
    singleEventController.descriptionController.text = event.description;
    dateController.updateSelectedDate(newDate: event.dateTime);
    timeController.updateSelectedTime(
        newTime: TimeOfDay.fromDateTime(event.dateTime));
    return Scaffold(
        appBar: CustomTopAppBar(
            title: "Termin bearbeiten",
            showDelete: false,
            showThreePoints: false,
            menu: ThreePointPopUpMenu(
                onSelected: (int result) {},
                entries: const ["Kategorie-Einstellungen"]).build(context)),
        bottomNavigationBar: CustomBottomAppBar(
            mainPage: MainPages.CalendarScreen, isMainPage: false),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditCalendarEventScreen(event: event)));
          },
          backgroundColor:
              CustomMaterialThemeColorConstant.dark.primaryContainer,
          child: Icon(
            Icons.edit,
            color: CustomMaterialThemeColorConstant.dark.onSurface,
          ),
        ),
        backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                  children: [
                    CustomReadOnlyTextField(
                      controller: singleEventController.titleController,
                      label: "Titel",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomDatePicker(label: "Datum wählen", enabled: false),
                    /* Possible Category selection */
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTimePicker(
                      label: "Zeit wählen",
                      enabled: false,
                    ),
                    CustomReadOnlyTextField(
                      controller: singleEventController.descriptionController,
                      label: 'Beschreibung',
                      multiline: true,
                    ),
                  ],
                )),
          ),
        );
  }
}
