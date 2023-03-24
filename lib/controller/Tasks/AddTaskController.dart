import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskController extends GetxController {
  final nameController = TextEditingController();
  final nameError = "".obs;
  final descriptionController = TextEditingController();
  final descriptionError = "".obs;

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
  }

  void displayError({String name = "", String description = ""}) {
    if(name.isNotEmpty) nameError.value = name;
    if(description.isNotEmpty) descriptionError.value = description;
  }

  void clearErrors() {
    nameError.value = "";
    descriptionError.value = "";
  }

  void clear() {
    nameController.clear();
    descriptionController.clear();
  }
}