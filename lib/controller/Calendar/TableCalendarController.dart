import 'package:get/get.dart';
import 'package:organizer_app/core/model/Event.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarController extends GetxController {
  var focusedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).obs;
  var selectedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).obs;
  var calendarFormat = CalendarFormat.month.obs;
  var eventList = [].obs;

  void changeSelectedDay(DateTime newDay) {
    selectedDay.value = newDay;
  }

  void changeFocusedDay(DateTime newDay) {
    focusedDay.value = newDay;
  }

  void changeCalendarFormat(CalendarFormat newFormat) {
    calendarFormat.value = newFormat;
  }

  void changeSelectedEvents(List<Event> newEvents) {
    eventList.value = newEvents;
  }
}