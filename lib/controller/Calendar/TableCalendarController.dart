import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarController extends GetxController {
  var focusedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).obs;
  var selectedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).obs;
  var calendarFormat = CalendarFormat.month.obs;

  void changeSelectedDay(DateTime newDay) {
    selectedDay.value = newDay;
  }

  void changeFocusedDay(DateTime newDay) {
    focusedDay.value = newDay;
  }

  void changeCalendarFormat(CalendarFormat newFormat) {
    calendarFormat.value = newFormat;
  }
}