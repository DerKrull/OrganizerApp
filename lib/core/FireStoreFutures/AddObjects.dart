import 'package:organizer_app/core/model/Event.dart';
import 'package:organizer_app/core/model/Expenditure.dart';
import 'package:organizer_app/core/model/TaskCategory.dart';

import '../model/Budget.dart';
import '../model/BudgetCategory.dart';
import '../model/Task.dart';
import 'FirebaseInstance.dart';

void addCategory(
    {required String categoryName,
    String categoryDescription = "",
    required int color}) {
  final data = BudgetCategory.fromBudgetCategory(
      name: categoryName, description: categoryDescription, color: color);
  print("save data: $data");
  db.collection("budgetCategory").add(data).then((documentSnapshot) =>
      print("Added data with id: ${documentSnapshot.id}"));
}

void addExpenditure(
    {required BudgetCategory category,
    String description = "",
    required String title,
    required double value,
    required DateTime date}) {
  final data = Expenditure.fromExpenditure(
      category: category,
      title: title,
      value: value,
      date: date,
      description: description);
  print("""Saving Expenditure:
  $data
  """);
  db
      .collection("expenditure")
      .add(data)
      .then((document) => print("Added data with id: ${document.id}"));
}

void addBudget({required value, required description, required date}) {
  final data =
      Budget.fromBudget(value: value, description: description, date: date);
  db.collection("budget").add(data).then((documentSnapshot) =>
      print("Added data with id: ${documentSnapshot.id}"));
}

void addEvent(
    {required String title,
    required String description,
    required DateTime dateTime}) {
  final data = Event.fromEvent(
      title: title, description: description, dateTime: dateTime);
  db.collection("event").add(data).then((documentSnapshot) =>
      print("Added data with id: ${documentSnapshot.id}"));
}

void addTask(
    {required isDaily,
    required name,
    required dueDate,
    required description,
    required done,
    required TaskCategory taskCategory,
    required Event event}) {
  final data = Task.fromTask(
      isDaily: isDaily,
      name: name,
      dueDate: dueDate,
      description: description,
      done: done,
      taskCategory: taskCategory, event: event);
  db.collection("task").add(data).then((documentSnapshot) =>
      print("Added data with id: ${documentSnapshot.id}"));
}

void addTaskCategory({required name}) {
  final data =
  TaskCategory.fromTaskCategory(name: name);
  db.collection("taskCategory").add(data).then((documentSnapshot) =>
      print("Added data with id: ${documentSnapshot.id}"));
}
