import 'package:cloud_firestore/cloud_firestore.dart';

class BudgetCategory {
  String docRef;
  String name;
  String description;

  int color;

  BudgetCategory(this.name, this.description, this.color, this.docRef);

  factory BudgetCategory.fromDocumentSnapshot({required DocumentSnapshot<Map<String, dynamic>> doc}) {
    return BudgetCategory(doc.data()!['name'], doc.data()!["description"], doc.data()!['color'], doc.id);
  }

  static Map<String, dynamic> addData({required name, required description, required int color}) {
    return {"name": name, "description": description, "color": color };
  }
}