import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleBudgetController extends GetxController {
  final valueController = TextEditingController();
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

  clear() {
    valueController.clear();
    descriptionController.clear();
  }
}