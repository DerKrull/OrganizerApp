import '../app_export.dart';

void deleteCategory({required String docRef}) {
  db
      .collection("budgetCategory")
      .doc(docRef)
      .delete()
      .then((documentSnapshot) => print("Deleted data with id: ${docRef}"));
}