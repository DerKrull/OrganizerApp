import 'package:cloud_firestore/cloud_firestore.dart' show DocumentSnapshot, Timestamp;

class Event {
  String title;
  String description;
  DateTime dateTime;

  Event(
      {required this.title, required this.description, required this.dateTime});

  factory Event.fromDocumentSnapshot(
      {required DocumentSnapshot<Map<String, dynamic>> doc}) {
    Timestamp timestamp = doc.data()!['dateTime'];
    return Event(
        title: doc.data()!['title'],
        description: doc.data()!['description'],
        dateTime: DateTime.fromMillisecondsSinceEpoch(
            timestamp.millisecondsSinceEpoch));
  }

  static Map<String, dynamic> fromExpenditure(
      {required String title,
      required String description,
      required DateTime dateTime}) {
    Timestamp timestamp = Timestamp.fromDate(dateTime);
    return {
      "title": title,
      "description": description,
      "dateTime": timestamp
    };
  }
}
