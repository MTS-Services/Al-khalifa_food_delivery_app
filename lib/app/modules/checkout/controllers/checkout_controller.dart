import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final count = 1.obs;
  final selectedIndex = (-1).obs;
  TextEditingController addressController = TextEditingController();
  TextEditingController instructionController = TextEditingController();
  void select(int index) {
    selectedIndex.value = index;
  }

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count > 1) {
      count.value--;
    }
  }
}
