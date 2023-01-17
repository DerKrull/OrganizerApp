import '../model/BudgetCategory.dart';
import 'FirebaseInstance.dart';

Future<BudgetCategory> getBudgetCategory(String docRef) async {
  try {
    var query = await db.collection("budgetCategory").doc(docRef).get();
    return BudgetCategory.fromDocumentSnapshot(doc: query);
  } catch (e) {
    rethrow;
  }
}

Future<List<BudgetCategory>> getBudgetCategories() async {
  List<BudgetCategory> list = [];
  try {
    var query = await db.collection("budgetCategory").get();
    query.docs.forEach((doc) {
      list.add(BudgetCategory.fromDocumentSnapshot(doc: doc));
    });
    return list;
  } catch (e) {
    rethrow;
  }
}
