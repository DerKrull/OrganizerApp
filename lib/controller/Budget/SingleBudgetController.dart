import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleBudgetController extends GetxController {
  final valueController = TextEditingController();
  var valueError = "".obs;
  final descriptionController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    valueController.dispose();
    descriptionController.dispose();
  }

  void displayError(
      {String value = ""}) {
    if(value.isNotEmpty) valueError.value = value;
  }

  void clearErrors() {
    valueError.value = "";
  }

  clear() {
    valueController.clear();
    descriptionController.clear();
  }
}