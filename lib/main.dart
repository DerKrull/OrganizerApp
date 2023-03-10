import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer_app/controller/Budget/SingleBudgetController.dart';
import 'package:organizer_app/controller/Calendar/TableCalendarController.dart';
import 'package:organizer_app/firebase_options.dart';
import 'package:organizer_app/screens/DataPrivacyScreen.dart';

import 'controller/Budget/SingleCategoryController.dart';
import 'controller/Budget/SingleExpenditureController.dart';
import 'controller/DateController.dart';
import 'controller/DropDownCategoryController.dart';
import 'controller/DropDownTaskCategoryController.dart';
import 'controller/MonthController.dart';
import 'controller/SingleTaskController.dart';
import 'controller/TaskTypeController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key});

  final TableCalendarController tableCalendarController = Get.put(TableCalendarController());
  final SingleBudgetController sbController = Get.put(SingleBudgetController());
  final SingleExpenditureController seController = Get.put(SingleExpenditureController());
  final DateController dateController = Get.put(DateController());
  final DropDownCategoryController ddcController = Get.put(DropDownCategoryController());
  final SingleCategoryController scController = Get.put(SingleCategoryController());
  final DropDownTaskCategoryController taskCategoryController = Get.put(DropDownTaskCategoryController());
  final SingleTaskController singleTaskController = Get.put(SingleTaskController());
  final TaskTypeController taskTypeController = Get.put(TaskTypeController());
  final MonthController monthController = Get.put(MonthController());

  @override
  Widget build(BuildContext context) {
    initialiseFirebase();
    return MaterialApp(
      title: 'Organizer App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
          useMaterial3: true),
      home: DataPrivacyScreen(),
    );
  }

  Future<void> initialiseFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}