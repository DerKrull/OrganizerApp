import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleTaskCategoryController extends GetxController {
  final nameController = TextEditingController();
  var nameError = "".obs;

  void displayError(
      {String title = "", String description = ""}) {
    if(title.isNotEmpty) nameError.value = title;
  }

  void clearErrors() {
    nameError.value = "";
  }

  @override
  void onClose() {
    nameController.dispose();
  }

  void clear() {
    nameController.clear();
  }
}