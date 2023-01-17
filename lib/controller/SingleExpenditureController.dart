import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:organizer_app/core/model/BudgetCategory.dart';

class SingleExpenditureController extends GetxController {
  String title = "";
  String description = "";
  double value = 0;
  DateTime actualDate = DateTime.now();

  final dateTextController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final valueController = TextEditingController();

  var category = BudgetCategory(name: "", description: "", color: 0, docRef: "").obs;


  void changeCategory({required BudgetCategory budgetCategory}) {
    category.value = budgetCategory;
  }

  void updateSelectedDate({required DateTime newDate}) {
    dateTextController.text = DateFormat("dd.MM.yyyy").format(newDate);
    actualDate = newDate;
  }

  @override
  void onInit() {
    dateTextController.text = DateFormat("dd.MM.yyyy").format(DateTime.now());

  }

  @override
  void onClose() {
    dateTextController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    valueController.dispose();
  }
}