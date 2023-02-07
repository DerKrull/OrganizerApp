import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MonthController extends GetxController {

  DateTime actualMonth =
      DateTime(DateTime.now().year, DateTime.now().month, 1, 12);
  final monthTextController = TextEditingController();

  void updateSelectedMonth({required DateTime newMonth}) {
    monthTextController.text = DateFormat("MMMM", "de_DE").format(newMonth);
    actualMonth = DateTime(newMonth.year, newMonth.month, 1, 12);
  }

  void clear() {
    updateSelectedMonth(newMonth: DateTime.now());
  }

  @override
  void onInit() {
    initializeDateFormatting('de_DE');
    monthTextController.text = DateFormat("MMMM", "de_DE")
        .format(DateTime(DateTime.now().year, DateTime.now().month, 1, 12));
  }

  @override
  void onClose() {
    monthTextController.dispose();
  }
}
