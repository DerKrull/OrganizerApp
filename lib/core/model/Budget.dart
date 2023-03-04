import 'package:cloud_firestore/cloud_firestore.dart';

class Budget {
  String description;
  DateTime date;
  double value;

  Budget({required this.date, required this.value, required this.description});

  factory Budget.fromDocumentSnapshot(
      {required DocumentSnapshot<Map<String, dynamic>> doc}) {
    Timestamp timestamp = doc.data()!['date'];
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
    var tmpValue = doc.data()!['value'];
    var description = doc.data()!['description'];
    if (tmpValue.runtimeType == int) {
      tmpValue = tmpValue.toDouble();
    } else if (tmpValue.runtimeType != double) {
      throw TypeError();
    }
    return Budget(date: date, value: tmpValue, description: description);
  }

  static Map<String, dynamic> fromBudget(
      {required value, required description, required DateTime date}) {
    Timestamp timestamp = Timestamp.fromDate(date);
    return {"value": value, "description": description, "date": timestamp};
  }
}
