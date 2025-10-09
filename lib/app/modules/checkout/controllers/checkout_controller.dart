import 'package:al_khalifa/app/modules/checkout/model/order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../api_services/order_service/order_service.dart';
import '../../cart/models/cart_item_model.dart';

class CheckoutController extends GetxController {
  final count = 1.obs;
  final selectedIndex = (-1).obs;
  TextEditingController addressController = TextEditingController();
  TextEditingController instructionController = TextEditingController();
  final OrderService _orderService = OrderService();
  var isLoading = false.obs;

  Future<void> submitOrder({
    required List<CartItem> cartItems,
    required double subtotal,
    required double deliveryFee,
    required double total,
  }) async {
    try {
      isLoading(true);

      // Convert cart items to order items
      final orderItems = cartItems.map((cartItem) {
        return OrderItem(
          foodId: cartItem.productId,
        ); // Use productId instead of id
      }).toList();

      // Create order request
      final orderRequest = OrderRequest(
        totalAmount: total,
        deliveryAddress: addressController.text.trim(),
        specialInstruction: instructionController.text.trim(),
        orderItems: orderItems,
      );

      // Post to API
      await _orderService.postOrder(orderRequest);

      // // Success - clear cart and navigate
      // Get.find<CartController>().clearCart(); // If you have this method
      // Get.offAllNamed(Routes.ORDER_SUCCESS); // Navigate to success page
      Get.snackbar('Success', 'Order placed successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to place order: $e');
      print('✅Order submission error: $e');
    } finally {
      isLoading(false);
    }
  }

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

  @override
  void onClose() {
    addressController.dispose();
    instructionController.dispose();
    super.onClose();
  }
}
