import 'package:get/get.dart';
import 'package:organizer_app/core/model/TaskCategory.dart';

class DropDownTaskCategoryController extends GetxController {
  TaskCategory initalCategory = TaskCategory(name: "", docRef: "");
  var category = TaskCategory(name: "", docRef: "").obs;

  void changeCategory({required TaskCategory taskCategory}) {
    category.value = taskCategory;
  }

  void clear() {
    category.value = initalCategory;
  }
}