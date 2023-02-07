import 'package:get/get.dart';

class TaskTypeController extends GetxController {
  var currentSelected = 0.obs;

  void changeCurrentSelected({required int index}) {
    currentSelected.value = index;
  }

  void clear() {
    currentSelected.value = 0;
  }
}