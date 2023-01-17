import 'package:get/get.dart';

import '../core/model/BudgetCategory.dart';

class DropDownCategoryController extends GetxController {
  var category = BudgetCategory(name: "", description: "", color: 0, docRef: "").obs;

  void changeCategory({required BudgetCategory budgetCategory}) {
    category.value = budgetCategory;
  }
}