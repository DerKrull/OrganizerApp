import '../app_export.dart';

void deleteCategory({required String docRef}) {
  db
      .collection("budgetCategory")
      .doc(docRef)
      .delete()
      .then((documentSnapshot) => print("Deleted data with id: ${docRef}"));
}

void deleteExpenditure({required String docRef}) {
  db
      .collection("expenditure")
      .doc(docRef)
      .delete()
      .then((documentSnapshot) => print("Deleted data with id: ${docRef}"));
}

void deleteTask({required String docRef}) {
  db
      .collection("task")
      .doc(docRef)
      .delete()
      .then((documentSnapshot) => print("Deleted data with id: ${docRef}"));
}
