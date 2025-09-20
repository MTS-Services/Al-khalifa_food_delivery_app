import 'package:get/get.dart';

class CustomBottoomBarController extends GetxController {
  var currentIndex = 0.obs;
  var isSelected = true;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
