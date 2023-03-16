import 'package:get/get.dart';

class SegmentedControlController extends GetxController {
  var selectedIndex = 0.obs;

  void onIndexChange(int index) {
    selectedIndex.value = index;
  }

}
