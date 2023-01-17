import 'package:cloud_firestore/cloud_firestore.dart';

class BudgetCategory {
  String docRef;
  String name;
  String description;

  int color;

  BudgetCategory(
      {required this.name,
      required this.description,
      required this.color,
      required this.docRef});

  factory BudgetCategory.fromDocumentSnapshot(
      {required DocumentSnapshot<Map<String, dynamic>> doc}) {
    return BudgetCategory(
        name: doc.data()!['name'],
        description: doc.data()!["description"],
        color: doc.data()!['color'],
        docRef: doc.id);
  }

  static Map<String, dynamic> addData(
      {required name, required description, required int color}) {
    return {"name": name, "description": description, "color": color};
  }
}
