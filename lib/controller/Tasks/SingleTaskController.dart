import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleTaskController extends GetxController {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final meetingController = TextEditingController();

  var valueError = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    meetingController.dispose();
  }

  void displayError({String value = ""}) {
    if(value.isEmpty) valueError.value = value;
  }

  void clearErrors() {
    valueError.value = "";
  }

  void clear() {
    nameController.clear();
    descriptionController.clear();
    meetingController.clear();
  }
}