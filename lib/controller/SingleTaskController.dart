import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleTaskController extends GetxController {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final meetingController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    meetingController.dispose();
  }

  void clear() {
    nameController.clear();
    descriptionController.clear();
    meetingController.clear();
  }
}