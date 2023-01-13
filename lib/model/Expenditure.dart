import 'package:cloud_firestore/cloud_firestore.dart';

class Expenditure {
  String docRef;
  DocumentReference category;
  String description;
  String title;

  double value;

  DateTime date;

  // Task task;
  // Event Event;

  Expenditure(this.docRef, this.category, this.description, this.title,
      this.value, this.date);

  factory Expenditure.fromDocumentSnapshot(
      {required DocumentSnapshot<Map<String, dynamic>> doc}) {
      var tmpValue = doc.data()!['value'];
      if(tmpValue.runtimeType == int) {
        tmpValue = tmpValue.toDouble();
      } else if (tmpValue.runtimeType != double) {
        throw TypeError();
      }
      Timestamp timestamp = doc.data()!['date'];
    return Expenditure(
        doc.id,
        (doc.data()!['category']),
        doc.data()!['description'],
        doc.data()!['title'],
        tmpValue,
        DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch));
  }
}
