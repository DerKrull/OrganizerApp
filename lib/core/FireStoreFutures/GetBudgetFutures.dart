import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/core/model/Budget.dart';
import 'package:organizer_app/core/model/Expenditure.dart';

Future<double?> getUsedBudgetPerCategory(
    String categoryRef, DateTime selectedDate) async {
  DocumentReference categoryDocRef =
      db.collection("budgetCategory").doc(categoryRef);
  double sum = 0;
  var queryResult = await db
      .collection("expenditure")
      .where("category", isEqualTo: categoryDocRef)
      .where("date", isGreaterThanOrEqualTo: getFirstTimeOfMonth(selectedDate))
      .where("date", isLessThanOrEqualTo: getLastTimeOfMonth(selectedDate))
      .get();
  for (var doc in queryResult.docs) {
    sum += Expenditure.fromDocumentSnapshot(doc: doc).value;
  }
  if (kDebugMode) {
    print("### Future getUsedBugetPerCategroy: $sum");
  }
  return sum;
}

Future<double?> getUsedBudgetTotal(DateTime selectedDate) async {
  double sum = 0;
  var queryResult = await db
      .collection("expenditure")
      .where("date", isGreaterThanOrEqualTo: getFirstTimeOfMonth(selectedDate))
      .where("date", isLessThanOrEqualTo: getLastTimeOfMonth(selectedDate))
      .get();
  for (var doc in queryResult.docs) {
    sum += Expenditure.fromDocumentSnapshot(doc: doc).value;
  }
  if (kDebugMode) {
    print("### Future getUsedBugetTotal: $sum");
  }
  return sum;
}

Future<double?> getTotalBudget(DateTime selectedDate) async {
  var queryResult = await db
      .collection("budget")
      .where("date", isGreaterThanOrEqualTo: getFirstTimeOfMonth(selectedDate))
      .where("date", isLessThanOrEqualTo: getLastTimeOfMonth(selectedDate))
      .get();
  if (queryResult.docs.length > 1) {
    if (kDebugMode) {
      print(
          "There is more than one budget available for the selected Month! Choosing the first one");
    }
  }
  return Budget.fromDocumentSnapshot(doc: queryResult.docs.first).value;
}
