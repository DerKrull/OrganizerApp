import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:organizer_app/controller/Budget/SingleBudgetController.dart';
import 'package:organizer_app/controller/Calendar/SingleEventController.dart';
import 'package:organizer_app/controller/Calendar/TableCalendarController.dart';
import 'package:organizer_app/controller/TimeController.dart';
import 'package:organizer_app/controller/DropDownEventController.dart';
import 'package:organizer_app/controller/Tasks/AddTaskController.dart';
import 'package:organizer_app/firebase_options.dart';
import 'package:organizer_app/screens/DataPrivacyScreen.dart';

import 'controller/Budget/SingleCategoryController.dart';
import 'controller/Budget/SingleExpenditureController.dart';
import 'controller/DateController.dart';
import 'controller/DropDownCategoryController.dart';
import 'controller/DropDownTaskCategoryController.dart';
import 'controller/MonthController.dart';
import 'controller/Tasks/SingleTaskController.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key});

  final SingleEventController singleEventController = Get.put(SingleEventController());
  final TimeController timeController = Get.put(TimeController());
  final TableCalendarController tableCalendarController = Get.put(TableCalendarController());
  final SingleBudgetController sbController = Get.put(SingleBudgetController());
  final SingleExpenditureController seController = Get.put(SingleExpenditureController());
  final DateController dateController = Get.put(DateController());
  final DropDownCategoryController ddcController = Get.put(DropDownCategoryController());
  final SingleCategoryController scController = Get.put(SingleCategoryController());
  final DropDownTaskCategoryController taskCategoryController = Get.put(DropDownTaskCategoryController());
  final SingleTaskController singleTaskController = Get.put(SingleTaskController());
  final MonthController monthController = Get.put(MonthController());
  final DropDownEventController dropDownEventController = Get.put(DropDownEventController());
  final AddTaskController addTaskController = Get.put(AddTaskController());

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