import 'dart:async';

import 'package:al_khalifa/app/api_services/oder_delete_api_services/order_delete_api_service.dart';
import 'package:al_khalifa/app/api_services/utility/urls.dart';
import 'package:al_khalifa/app/modules/order_history/controllers/order_history_controller.dart';
import 'package:al_khalifa/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../api_services/order_service/my_order.dart';
import '../../order_history/models/my_order_model.dart';

class OrderController extends GetxController {
  RxBool orderDeleteInProgress = false.obs;

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

        // remove order locally before API refresh
        final orderHistoryController = Get.find<OrderHistoryController>();
        orderHistoryController.myOrders.removeWhere((order) => order.id == orderId);
        orderHistoryController.update();

        // optional: re-fetch to ensure sync
        await orderHistoryController.fetchMyOrders();

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
}