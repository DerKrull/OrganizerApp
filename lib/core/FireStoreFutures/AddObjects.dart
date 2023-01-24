import 'package:organizer_app/core/model/Expenditure.dart';

import '../model/BudgetCategory.dart';
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

void addExpenditure({required BudgetCategory category,
  String description = "",
  required String title,
  required double value,
  required DateTime date}) {
  final data = Expenditure.fromExpenditure(category: category, title: title, value: value, date: date, description: description);
  print("""Saving Expenditure:
  $data
  """);
  db.collection("expenditure").add(data).then((document) => print("Added data with id: ${document.id}"));
}