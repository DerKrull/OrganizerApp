import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer_app/controller/DateController.dart';
import 'package:organizer_app/controller/DropDownCategoryController.dart';
import 'package:organizer_app/controller/DropDownTaskCategoryController.dart';
import 'package:organizer_app/controller/MonthController.dart';
import 'package:organizer_app/controller/SingleCategoryController.dart';
import 'package:organizer_app/controller/SingleExpenditureController.dart';
import 'package:organizer_app/controller/SingleTaskController.dart';
import 'package:organizer_app/controller/TaskTypeController.dart';
import 'package:organizer_app/firebase_options.dart';
import 'package:organizer_app/screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key});

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
      home: HomeScreen(),
    );
  }

  Future<void> initialiseFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}