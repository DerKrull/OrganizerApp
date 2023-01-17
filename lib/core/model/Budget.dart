import 'package:cloud_firestore/cloud_firestore.dart';

class Budget {
  DateTime  date;
  double value;

  Budget({required this.date, required this.value});

  factory Budget.fromDocumentSnapshot({required DocumentSnapshot<Map<String, dynamic>> doc}) {
    Timestamp timestamp = doc.data()!['date'];
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
    var tmpValue = doc.data()!['value'];
    if(tmpValue.runtimeType == int) {
      tmpValue = tmpValue.toDouble();
    } else if (tmpValue.runtimeType != double) {
      throw TypeError();
    }
    return Budget(date: date, value: tmpValue);
  }
}

