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
