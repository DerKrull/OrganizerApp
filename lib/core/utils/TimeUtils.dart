import 'package:cloud_firestore/cloud_firestore.dart';

Timestamp getFirstTimeOfMonth(DateTime selectedDate) {
  DateTime date = DateTime(selectedDate.year, selectedDate.month, 1, 0, 0, 0);
  return Timestamp.fromDate(date);
}

Timestamp getLastTimeOfMonth(DateTime selectedDate) {
  DateTime lastDay =
      DateTime(selectedDate.year, selectedDate.month + 1, 0, 23, 59, 59);
  return Timestamp.fromDate(lastDay);
}
