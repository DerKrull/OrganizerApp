import 'package:get/get.dart';
import 'package:organizer_app/core/model/TaskCategory.dart';

class DropDownTaskCategoryController extends GetxController {
  TaskCategory initalCategory = TaskCategory(name: "", docRef: "");
  var category = TaskCategory(name: "", docRef: "").obs;
  var categoryError = "".obs;

  void changeCategory({required TaskCategory taskCategory}) {
    category.value = taskCategory;
  }

  void clear() {
    category.value = initalCategory;
  }

  void clearErrors() {
    categoryError.value = "";
  }

  void displayError({String category = ""}) {
    if(category.isNotEmpty) categoryError.value = category;
  }
}