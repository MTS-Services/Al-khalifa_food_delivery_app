import 'package:get/get.dart';

class CheckoutController extends GetxController {
  //TODO: Implement CheckoutController

  final count = 1.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() {
   if(count>=1){
     count.value++;
   }
  }
  void decrement() {
    if(count>1){
      count.value--;
    }
  }
}
