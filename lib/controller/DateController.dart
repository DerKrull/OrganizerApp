import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController {
  // move to own controller
  DateTime actualDate = DateTime.now();
  final dateTextController = TextEditingController();

  void updateSelectedDate({required DateTime newDate}) {
    dateTextController.text = DateFormat("dd.MM.yyyy").format(newDate);
    actualDate = newDate;
  }

  void clear() {
    updateSelectedDate(newDate: DateTime.now());
  }

  @override
  void onInit() {
    dateTextController.text = DateFormat("dd.MM.yyyy").format(DateTime.now());
  }

  @override
  void onClose() {
    dateTextController.dispose();
  }
}