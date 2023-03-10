import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:organizer_app/controller/Calendar/TableCalendarController.dart';
import 'package:table_calendar/table_calendar.dart';

import '../core/app_export.dart';
import '../widgets/CustomBottomAppBar.dart';
import '../widgets/CustomTopAppBarMainPage.dart';
import '../widgets/ThreePointPopUpMenu.dart';

class CalendarMontHScreen extends StatefulWidget {
  CalendarMontHScreen({Key? key}) : super(key: key);

  @override
  State<CalendarMontHScreen> createState() => _CalendarMontHScreenState();
}

class _CalendarMontHScreenState extends State<CalendarMontHScreen> {
  TableCalendarController tableCalendarController = Get.find();

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('de_DE');
    return SafeArea(
        child: Scaffold(
            appBar: CustomTopAppBarMainPage(
                title: "Budget",
                showThreePoints: true,
                menu: ThreePointPopUpMenu(
                    onSelected: (int result) {},
                    entries: const ["Budget-Einstellungen"]).build(context)),
            bottomNavigationBar: CustomBottomAppBar(
              mainPage: MainPages.CalendarScreen,
              isMainPage: true,
            ),
            backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor:
                  CustomMaterialThemeColorConstant.dark.primaryContainer,
              child: Icon(
                Icons.add,
                color: CustomMaterialThemeColorConstant.dark.onSurface,
              ),
            ),
            body: Obx(() => Padding(
              padding: getPadding(left: 8, right: 8),
              child: TableCalendar(
                    firstDay: DateTime(DateTime.now().year - 10),
                    lastDay: DateTime(DateTime.now().year + 10),
                    focusedDay: tableCalendarController.focusedDay.value,
                    calendarFormat: tableCalendarController.calendarFormat.value,
                    calendarStyle: getCalendarStyle(),
                    headerStyle: getHeaderStyle(),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    weekendDays: [DateTime.sunday],
                    weekNumbersVisible: true,
                    selectedDayPredicate: (day) {
                      return isSameDay(
                          tableCalendarController.selectedDay.value, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(tableCalendarController.selectedDay.value,
                          selectedDay)) {
                        tableCalendarController.changeSelectedDay(selectedDay);
                        setState(() {});
                      }
                    },
                    onFormatChanged: (format) {
                      if (tableCalendarController.calendarFormat.value !=
                          format) {
                        tableCalendarController.changeCalendarFormat(format);
                        setState(() {});
                      }
                    },
                    onPageChanged: (focusedDay) {
                      tableCalendarController.changeFocusedDay(focusedDay);
                    },
                  ),
            ))));
  }

  CalendarStyle getCalendarStyle() {
    return CalendarStyle(
      cellMargin: const EdgeInsets.all(3.0),
      defaultTextStyle:
          TextStyle(color: CustomMaterialThemeColorConstant.dark.onBackground),
      outsideTextStyle:
          TextStyle(color: CustomMaterialThemeColorConstant.dark.outline),
      todayTextStyle: TextStyle(
          color: CustomMaterialThemeColorConstant.dark.onTertiaryContainer),
      todayDecoration: BoxDecoration(
          border: Border.all(
              color: CustomMaterialThemeColorConstant.dark.tertiaryContainer,
              width: 3.0),
          shape: BoxShape.circle),
      selectedTextStyle:
          TextStyle(color: CustomMaterialThemeColorConstant.dark.onPrimary),
      selectedDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CustomMaterialThemeColorConstant.dark.primary),
      weekendTextStyle:
          TextStyle(color: CustomMaterialThemeColorConstant.dark.tertiary),
      weekNumberTextStyle: TextStyle(
          color: CustomMaterialThemeColorConstant.dark.errorContainer,
          fontSize: 10.0),
      isTodayHighlighted: true,
    );
  }

  HeaderStyle getHeaderStyle() {
    return HeaderStyle(
        titleTextStyle: TextStyle(
            color: CustomMaterialThemeColorConstant.dark.onSurface,
            fontSize: 24.0),
        formatButtonTextStyle: TextStyle(
            color: CustomMaterialThemeColorConstant.dark.onSurface,
            fontSize: 16.0),
        formatButtonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                color: CustomMaterialThemeColorConstant.dark.onSurface)),
        formatButtonShowsNext: false,
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: CustomMaterialThemeColorConstant.dark.onSurface,
        ),
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: CustomMaterialThemeColorConstant.dark.onSurface,
        ));
  }
}
