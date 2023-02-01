

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../app_export.dart';
import 'FirebaseInstance.dart';

Future<String?> getTaskCategoryName(
    String categoryRef) async {
  DocumentReference categoryDocRef =
  db.collection("taskCategory").doc(categoryRef);
  var queryResult = await categoryDocRef.get();
  String name = queryResult.get("name");
  if (kDebugMode) {
    print("### Future getTaskCategoryName: $name");
  }
  return name;
}
