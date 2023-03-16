import '../model/Budget.dart';
import '../model/BudgetCategory.dart';
import '../model/Expenditure.dart';
import '../model/Task.dart';
import 'FirebaseInstance.dart';

void updateCategory(
    {required String docRef,
    required String categoryName,
    String categoryDescription = "",
    required int color}) {
  final data = BudgetCategory.fromBudgetCategory(
      name: categoryName, description: categoryDescription, color: color);
  db
      .collection("budgetCategory")
      .doc(docRef)
      .update(data)
      .then((documentSnapshot) => print("Updated data with id: ${docRef}"));
}

void updateExpenditure(
    {required String docRef,
    required BudgetCategory category,
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
      .doc(docRef)
      .update(data)
      .then((document) => print("Added data with id: $docRef"));
}

void updateBudget(
    {required docRef, required value, required description, required date}) {
  final data =
      Budget.fromBudget(value: value, description: description, date: date);
  db
      .collection("budget")
      .doc(docRef)
      .update(data)
      .then((documentSnapshot) => print("Update data with id: ${docRef}"));
}

void updateTask(
    {required docRef,
    required isDaily,
    required name,
    required dueDate,
    required description,
    required done,
    required taskCategory,
    required event}) {
  final data = Task.fromTask(
      isDaily: isDaily,
      name: name,
      dueDate: dueDate,
      description: description,
      done: done,
      taskCategory: taskCategory,
      event: event);
  db
      .collection("task")
      .doc(docRef)
      .update(data)
      .then((documentSnapshot) => print("Updated data with id: $docRef"));
}
