import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleCategoryController extends GetxController {
  var color = const Color(0x00000000).obs();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void onInit() {
    color =  Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
  }

  void changeColor({required newColor}) {
    color = newColor;
  }
}