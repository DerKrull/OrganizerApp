import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MonthController extends GetxController {

  var actualMonth =
      DateTime(DateTime.now().year, DateTime.now().month, 1, 12).obs;
  final monthTextController = TextEditingController();

  void updateSelectedMonth({required DateTime newMonth}) {
    monthTextController.text = DateFormat("MMMM", "de_DE").format(newMonth);
    actualMonth.value = DateTime(newMonth.year, newMonth.month, 1, 12);
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
