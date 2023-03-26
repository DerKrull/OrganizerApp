import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:organizer_app/controller/Calendar/TableCalendarController.dart';
import 'package:organizer_app/core/model/Event.dart';
import 'package:organizer_app/screens/Calendar/ShowCalendarEventScreen.dart';
import 'package:table_calendar/table_calendar.dart';

import '../core/app_export.dart';
import '../widgets/CustomBottomAppBar.dart';
import '../widgets/CustomTopAppBarMainPage.dart';
import '../widgets/ThreePointPopUpMenu.dart';
import 'Calendar/AddCalendarEventScreen.dart';

class CalendarMonthScreen extends StatefulWidget {
  const CalendarMonthScreen({Key? key}) : super(key: key);

  @override
  State<CalendarMonthScreen> createState() => _CalendarMonthScreenState();
}

class _CalendarMonthScreenState extends State<CalendarMonthScreen> {
  TableCalendarController tableCalendarController = Get.find();

  late List<Event> events;

  List<Event> eventLoader(DateTime dateTime) {
    List<Event> result = <Event>[];
    for (var event in events) {
      if (isSameDay(event.dateTime, dateTime)) {
        result.add(event);
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('de_DE');
    return SafeArea(
        child: Scaffold(
            appBar: CustomTopAppBarMainPage(
                title: "Kalender",
                showThreePoints: true,
                menu: ThreePointPopUpMenu(
                    onSelected: (int result) {},
                    entries: const ["Kalender-Einstellungen"]).build(context)),
            bottomNavigationBar: CustomBottomAppBar(
              mainPage: MainPages.CalendarScreen,
              isMainPage: true,
            ),
            backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddCalendarEventScreen()));
              },
              backgroundColor:
                  CustomMaterialThemeColorConstant.dark.primaryContainer,
              child: Icon(
                Icons.add,
                color: CustomMaterialThemeColorConstant.dark.onSurface,
              ),
            ),
            body: FutureBuilder<List<Event>>(
                future: getEvents(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else if (snapshot.hasData) {
                    events = snapshot.data!;
                    tableCalendarController.changeSelectedEvents(
                        eventLoader(tableCalendarController.selectedDay.value));
                    return Padding(
                      padding: getPadding(left: 8, right: 8),
                      child: Column(
                        children: [
                          TableCalendar(
                            firstDay: DateTime(DateTime.now().year - 10),
                            lastDay: DateTime(DateTime.now().year + 10),
                            focusedDay:
                                tableCalendarController.focusedDay.value,
                            calendarFormat:
                                tableCalendarController.calendarFormat.value,
                            calendarStyle: getCalendarStyle(),
                            headerStyle: getHeaderStyle(),
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            weekendDays: const [DateTime.sunday],
                            weekNumbersVisible: true,
                            eventLoader: eventLoader,
                            locale: "DE_de",
                            selectedDayPredicate: (day) {
                              return isSameDay(
                                  tableCalendarController.selectedDay.value,
                                  day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              if (!isSameDay(
                                  tableCalendarController.selectedDay.value,
                                  selectedDay)) {
                                tableCalendarController
                                    .changeSelectedDay(selectedDay);
                                tableCalendarController.changeSelectedEvents(
                                    eventLoader(selectedDay));
                                setState(() {});
                              }
                            },
                            onFormatChanged: (format) {
                              if (tableCalendarController
                                      .calendarFormat.value !=
                                  format) {
                                tableCalendarController
                                    .changeCalendarFormat(format);
                                setState(() {});
                              }
                            },
                            onPageChanged: (focusedDay) {
                              tableCalendarController
                                  .changeFocusedDay(focusedDay);
                            },
                          ),
                          const SizedBox(height: 8.0),
                          Expanded(
                              child: ListView.builder(
                                  itemCount:
                                      tableCalendarController.eventList.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 6.0,
                                          vertical: 2.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              CustomMaterialThemeColorConstant
                                                  .dark.secondaryContainer,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: ListTile(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ShowCalendarEventScreen(
                                                            event: tableCalendarController
                                                                    .eventList[
                                                                index])));
                                          },
                                          title: Text(tableCalendarController
                                              .eventList[index].title),
                                          textColor:
                                              CustomMaterialThemeColorConstant
                                                  .dark.onSurface,
                                          subtitle: Text(tableCalendarController
                                              .eventList[index].description),
                                          trailing: Text(
                                            "um ${DateFormat("hh:mm").format(tableCalendarController.eventList[index].dateTime)}",
                                            style:
                                                const TextStyle(fontSize: 16.0),
                                          ),
                                        ));
                                  }))
                        ],
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                })));
  }

  CalendarStyle getCalendarStyle() {
    return CalendarStyle(
        cellMargin: const EdgeInsets.all(3.0),
        defaultTextStyle: TextStyle(
            color: CustomMaterialThemeColorConstant.dark.onBackground),
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
            color: CustomMaterialThemeColorConstant.dark.onPrimaryContainer),
        weekendTextStyle:
            TextStyle(color: CustomMaterialThemeColorConstant.dark.tertiary),
        weekNumberTextStyle: TextStyle(
            color: CustomMaterialThemeColorConstant.dark.errorContainer,
            fontSize: 10.0),
        isTodayHighlighted: true,
        markerDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CustomMaterialThemeColorConstant.dark.tertiary));
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
