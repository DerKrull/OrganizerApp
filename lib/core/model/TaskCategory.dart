import 'package:cloud_firestore/cloud_firestore.dart';

class TaskCategory {
  String docRef;
  String name;

  TaskCategory(
      {required this.name,
      required this.docRef});

  factory TaskCategory.fromDocumentSnapshot(
      {required DocumentSnapshot<Map<String, dynamic>> doc}) {
    return TaskCategory(
        name: doc.data()!['name'],
        docRef: doc.id);
  }

  static Map<String, dynamic> fromTaskCategory(
      {required name}) {
    return {"name": name};
  }
}
