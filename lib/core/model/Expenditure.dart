import 'package:cloud_firestore/cloud_firestore.dart';

import '../app_export.dart';
import 'BudgetCategory.dart';

class Expenditure {
  String docRef;
  DocumentReference category;
  String description;
  String title;

  double value;

  DateTime date;

  // Task task;
  // Event Event;

  Expenditure(
      {required this.docRef,
      required this.category,
      required this.description,
      required this.title,
      required this.value,
      required this.date});

  factory Expenditure.fromDocumentSnapshot(
      {required DocumentSnapshot<Map<String, dynamic>> doc}) {
    var tmpValue = doc.data()!['value'];
    if (tmpValue.runtimeType == int) {
      tmpValue = tmpValue.toDouble();
    } else if (tmpValue.runtimeType != double) {
      throw TypeError();
    }
    Timestamp timestamp = doc.data()!['date'];
    return Expenditure(
        docRef: doc.id,
        category: doc.data()!['category'],
        description: doc.data()!['description'],
        title: doc.data()!['title'],
        value: tmpValue,
        date: DateTime.fromMillisecondsSinceEpoch(
            timestamp.millisecondsSinceEpoch));
  }

  static Map<String, dynamic> fromExpenditure(
      {required BudgetCategory category,
      String description = "",
      required String title,
      required double value,
      required DateTime date}) {
    Timestamp timestamp = Timestamp.fromDate(date);
    return {
      "category": db.collection("budgetCategory").doc(category.docRef),
      "description": description,
      "date": timestamp,
      "title": title,
      "value": value
    };
  }
}
