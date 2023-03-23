import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeController extends GetxController {
  TimeOfDay actualTime = TimeOfDay.now();
  final timeTextController = TextEditingController();

  void updateSelectedTime({required TimeOfDay newTime}) {

    timeTextController.text = "${newTime.hour}:${newTime.minute}";
    actualTime = newTime;
  }

  void clear() {
    updateSelectedTime(newTime: TimeOfDay.now());
  }

  @override
  void onClose() {
    timeTextController.dispose();
  }
}
