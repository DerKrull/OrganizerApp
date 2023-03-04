import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organizer_app/core/model/Task.dart';
import 'package:organizer_app/core/model/TaskCategory.dart';

import '../app_export.dart';
import '../model/BudgetCategory.dart';

Future<BudgetCategory> getBudgetCategory(String docRef) async {
  try {
    var query = await db.collection("budgetCategory").doc(docRef).get();
    return BudgetCategory.fromDocumentSnapshot(doc: query);
  } catch (e) {
    rethrow;
  }
}

Future<List<BudgetCategory>> getBudgetCategories() async {
  List<BudgetCategory> list = [];
  try {
    var query = await db.collection("budgetCategory").get();
    query.docs.forEach((doc) {
      list.add(BudgetCategory.fromDocumentSnapshot(doc: doc));
    });
    return list;
  } catch (e) {
    rethrow;
  }
}

Future<DocumentSnapshot<Map<String,dynamic>>> getBudget(DateTime selectedDate) async {
  try {
    var queryResult = await db
        .collection("budget")
        .where("date", isGreaterThanOrEqualTo: getFirstTimeOfMonth(selectedDate))
        .where("date", isLessThanOrEqualTo: getLastTimeOfMonth(selectedDate))
        .get();
    return queryResult.docs.first;
  } catch (e) {
    rethrow;
  }
}

Future<List<Task>> getDailyTasks() async {
  List<Task> list = [];
  try {
    var query = await db.collection("task").where("isDaily", isEqualTo: true).get();
    query.docs.forEach((doc) {
      list.add(Task.fromDocumentSnapshot(doc: doc));
    });
    return list;
  } catch (e) {
    rethrow;
  }
}

Future<List<Task>> getTasks() async {
  List<Task> list = [];
  try {
    var query = await db.collection("task").where("isDaily", isEqualTo: false).get();
    query.docs.forEach((doc) {
      list.add(Task.fromDocumentSnapshot(doc: doc));
    });
    return list;
  } catch (e) {
    rethrow;
  }
}

Future<List<TaskCategory>> getTaskCategories() async {
  List<TaskCategory> list = [];
  try {
    var query = await db.collection("taskCategory").get();
    query.docs.forEach((doc) {
      list.add(TaskCategory.fromDocumentSnapshot(doc: doc));
    });
    return list;
  } catch (e) {
    rethrow;
  }
}