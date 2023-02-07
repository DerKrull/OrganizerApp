
import 'package:flutter/foundation.dart';
import 'package:organizer_app/core/model/TaskCategory.dart';

import '../app_export.dart';
import 'FirebaseInstance.dart';

Future<TaskCategory> getTaskCategoryName(
    String categoryRef) async {
  var queryResult = await db.collection("taskCategory").doc(categoryRef).get();
  TaskCategory result = TaskCategory.fromDocumentSnapshot(doc: queryResult);
  if (kDebugMode) {
    print("### Future getTaskCategoryName: $result");
  }
  return result;
}
