import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleEventController extends GetxController {
  final titleController = TextEditingController();
  var titleError = "".obs;
  final descriptionController = TextEditingController();
  var descriptionError = "".obs;

  void displayError(
      {String title = "", String description = ""}) {
    if(title.isNotEmpty) titleError.value = title;
    if(description.isNotEmpty) descriptionError.value = description;
  }

  void clearErrors() {
    titleError.value = "";
    descriptionError.value = "";
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
  }

  void clear() {
    titleController.clear();
    descriptionController.clear();
  }
}