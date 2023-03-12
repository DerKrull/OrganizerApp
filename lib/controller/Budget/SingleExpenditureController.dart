import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleExpenditureController extends GetxController {
  final titleController = TextEditingController();
  var titleError = "".obs;
  final descriptionController = TextEditingController();
  var descriptionError = "".obs;
  final valueController = TextEditingController();
  var valueError = "".obs;

  void displayError(
      {String title = "", String description = "", String value = ""}) {
    if(title.isNotEmpty) titleError.value = title;
    if(description.isNotEmpty) descriptionError.value = description;
    if(value.isNotEmpty) valueError.value = value;
  }

  void clearErrors() {
    titleError.value = "";
    descriptionError.value = "";
    valueError.value = "";
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    valueController.dispose();
  }

  void clear() {
    titleController.clear();
    descriptionController.clear();
    valueController.clear();
  }
}
