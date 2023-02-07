import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organizer_app/core/model/TaskCategory.dart';

import '../FireStoreFutures/FirebaseInstance.dart';

class Task {
  String taskRef;
  bool isDaily;
  String name;
  DateTime dueDate;
  String description;
  bool done;

  DocumentReference taskCategory;

  // Meeting meeting;

  Task(
      {required this.taskRef,
      required this.isDaily,
      required this.name,
      required this.dueDate,
      required this.description,
      required this.done,
      required this.taskCategory});

  factory Task.fromDocumentSnapshot(
      {required DocumentSnapshot<Map<String, dynamic>> doc}) {
    Timestamp timestamp = doc.data()!["dueDate"];
    return Task(
        name: doc.data()!['name'],
        description: doc.data()!["description"],
        isDaily: doc.data()!["isDaily"],
        dueDate: DateTime.fromMillisecondsSinceEpoch(
            timestamp.millisecondsSinceEpoch),
        done: doc.data()!["done"],
        taskCategory: doc.data()!["taskCategory"],
        taskRef: doc.id);
  }

  static Map<String, dynamic> fromTask(
      {required isDaily,
      required name,
      required dueDate,
      required description,
      required done,
      required TaskCategory taskCategory}) {
    Timestamp timestamp = Timestamp.fromDate(dueDate);
    return {
      "name": name,
      "description": description,
      "isDaily": isDaily,
      "dueDate": timestamp,
      "done": done,
      "taskCategory": db.collection("taskCategory").doc(taskCategory.docRef)
    };
  }
}
