import 'package:get/get.dart';
import '../../../api_services/oder_delete_api_services/order_delete_api_service.dart';
import '../../../api_services/order_service/my_order.dart';
import '../../../api_services/utility/urls.dart';
import '../../../routes/app_pages.dart';
import '../models/my_order_model.dart';
import 'dart:async';

class OrderHistoryController extends GetxController {
  var isLoading = false.obs;
  var orderDetails = Rxn<OrderDetailsModel>();
  RxBool orderDeleteInProgress = false.obs;

  Future<void> fetchOrderDetails() async {
    try {
      isLoading(true);
      final data = await OrderService.getOrderDetails();

      if (data != null) {
        orderDetails.value = data;
        startOrderTimer(); // ✅ start again for new order
        refresh();
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> orderDeleteHistory(int orderId) async {
    orderDeleteInProgress.value = true;
    update();
    try {
      final response = await OrderDeleteApiService.orderDeleteApiRequest(
        Urls.orderDelete(orderId),
      );
      orderDeleteInProgress.value = false;

      if (response.statusCode == 204) {
        Get.snackbar('Success', 'Order Deleted successfully');
        await fetchOrderDetails();
        Get.offAllNamed(Routes.CUSTOM_BOTTOOM_BAR, arguments: {"index": 2});
      } else {
        update();
        Get.snackbar('Failed', response.body);
      }
    } catch (e) {
      orderDeleteInProgress.value = false;
      update();
      Get.snackbar('Failed', '$e');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchOrderDetails();
    super.onInit();
  }

  /// Countdown for cancel availability (5 min = 300 seconds)
  RxInt remainingTime = 120.obs;
  Timer? _timer;

  /// Flag to disable cancel button
  bool get canCancel => remainingTime.value > 0;

  /// Start 5-minute timer when opening order
  void startOrderTimer() {
    _timer?.cancel(); // cancel any previous timer
    remainingTime.value = 120;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value <= 0) {
        timer.cancel();
      } else {
        remainingTime.value--;
      }
    });
  }

  /// Stop timer
  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  String get formattedTime {
    final minutes = (remainingTime.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingTime.value % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void onClose() {
    stopTimer();
    super.onClose();
  }
}
