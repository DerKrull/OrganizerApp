import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/core/model/BudgetCategory.dart';

void updateCategory({ required String docRef, required String categoryName,String categoryDescription = "", required int color}) {
  final data = BudgetCategory.addData(
      name: categoryName,
      description: categoryDescription,
      color: color);
      db.collection("budgetCategory").doc(docRef).update(data).then((documentSnapshot) =>
      print("Updated data with id: ${docRef}"));
}