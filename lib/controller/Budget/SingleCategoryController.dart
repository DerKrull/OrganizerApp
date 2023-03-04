import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleCategoryController extends GetxController {
  var color =  Color(0).obs;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    color.value =  Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    descriptionController.dispose();
  }

  void changeColor(Color newColor) {
    color.value = newColor;
  }
  clear() {
    color.value = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    nameController.clear();
    descriptionController.clear();
  }
}