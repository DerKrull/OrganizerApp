import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleExpenditureController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final valueController = TextEditingController();

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    valueController.dispose();
  }
}