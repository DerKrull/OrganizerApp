import '../model/BudgetCategory.dart';
import 'FirebaseInstance.dart';

void addCategory(
    {required String categoryName,
    String categoryDescription = "",
    required int color}) {
  final data = BudgetCategory.addData(
      name: categoryName, description: categoryDescription, color: color);
  print("save data: $data");
  db.collection("budgetCategory").add(data).then((documentSnapshot) =>
      print("Added data with id: ${documentSnapshot.id}"));
}
