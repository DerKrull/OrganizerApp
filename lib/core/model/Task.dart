import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organizer_app/core/model/Event.dart';
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

  DocumentReference event;

  Task(
      {required this.taskRef,
      required this.isDaily,
      required this.name,
      required this.dueDate,
      required this.description,
      required this.done,
      required this.taskCategory,
      required this.event});

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
        taskRef: doc.id,
        event: doc.data()!["event"]);
  }

  static Map<String, dynamic> fromTask(
      {required isDaily,
      required name,
      required dueDate,
      required description,
      required done,
      required TaskCategory taskCategory,
      required Event event}) {
    Timestamp timestamp = Timestamp.fromDate(dueDate);
    return {
      "name": name,
      "description": description,
      "isDaily": isDaily,
      "dueDate": timestamp,
      "done": done,
      "taskCategory": db.collection("taskCategory").doc(taskCategory.docRef),
      "event": db.collection("event").doc(event.docRef)
    };
  }

  static Map<String, dynamic> fromTaskChangeDone(
      {required isDaily,
        required name,
        required dueDate,
        required description,
        required done}) {
    Timestamp timestamp = Timestamp.fromDate(dueDate);
    return {
      "name": name,
      "description": description,
      "isDaily": isDaily,
      "dueDate": timestamp,
      "done": done
    };
  }
}
