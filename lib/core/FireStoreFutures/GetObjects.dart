import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/core/model/BudgetCategory.dart';

Future<BudgetCategory> getBudgetCategory(String docRef) async {
  try {
    var query = await db.collection("budgetCategory").doc(docRef).get();
    return BudgetCategory.fromDocumentSnapshot(doc: query);
  } catch (e) {
    rethrow;
  }
}
