import 'dart:async';

import 'package:get/get.dart';

import '../../../api_services/order_service/my_order.dart';
import '../models/my_order_model.dart';

class OrderController extends GetxController {
  var isLoading = false.obs;
  var myOrders = <MyOrderModel>[].obs;
  var errorMessage = ''.obs;
  Timer? _timer;
  final remainingTime = 600.obs;

  @override
  void onInit() {
    super.onInit();
    print('OrderController initialized');
    startTimer();
    fetchMyOrders();
  }

  Future<void> fetchMyOrders() async {
    try {
      isLoading(true);
      errorMessage('');

      final orders = await MyOrder.getMyOrder();
      myOrders.assignAll(orders);

      print('Fetched ${orders.length} orders');
      
    } catch (e) {
      errorMessage(e.toString());
      print('Error fetching orders: $e');
      // Retry after 3 seconds if there's an error
      await Future.delayed(Duration(seconds: 3));
      fetchMyOrders();
    } finally {
      isLoading(false);
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (remainingTime.value < 1) {
        timer.cancel();
        print('Timer finished');
      } else {
        remainingTime.value--;
      }
    });
  }

  // Manual refresh method
  Future<void> refreshOrders() async {
    print('Manual refresh triggered');
    await fetchMyOrders();
  }

  String get formattedTime {
    final minutes = (remainingTime.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingTime.value % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void onClose() {
    _timer?.cancel();
    print('OrderController disposed');
    super.onClose();
  }
}