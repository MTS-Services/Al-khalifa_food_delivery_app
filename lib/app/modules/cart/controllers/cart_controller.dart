/*
import 'dart:convert';

import 'package:al_khalifa/app/api_services/cart_list_api_services/cart_list_api_services.dart';
import 'package:al_khalifa/app/api_services/utility/urls.dart';
import 'package:al_khalifa/app/modules/cart/models/cart_item_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  bool cartInProgress = false;
  List<CartItem> cartItemModelData = [];

  Future<bool> getCartListData() async {
    cartInProgress = true;
    update();
    try {
      final response = await CartListApiServices.cartListApiRequest(
        Urls.cartList,
      );
      cartInProgress = false;
      print("cart response ${response.statusCode}");
      print("cart response body ${response.body}");
      if (response.statusCode == 200) {

        List<dynamic> decodedResponse = jsonDecode(response.body);



        cartItemModelData = decodedResponse
            .map((e) => CartItem.fromJson(e))
            .toList();



        print("called");
        print("called ${cartItemModelData.length}");
        update();
        return true;
      } else {
        print("cart response ${response.statusCode}");
        update();
        return false;
      }
    } catch (e) {
      cartInProgress = false;
      update();
      return false;
    }
  }

  @override
  void onInit() {
    print("onItCalled");
    getCartListData();
    super.onInit();
  }
}
*/
import 'dart:convert';
import 'package:get/get.dart';

import '../../../api_services/cart_list_api_services/cart_list_api_services.dart';
import '../../../api_services/utility/urls.dart';
import '../models/cart_item_model.dart';

class CartController extends GetxController {
  bool cartInProgress = false;
  bool deleteInProgress=false;


  List<CartItem> cartItemModelData = [];

  final quantities = <int, RxInt>{}.obs;


  double deliveryFee = 20;
  double platformFee = 50;
  double vatRate = 0.0;


  String money(num v) {

    final s = v.toString();
    final cleaned = s.endsWith('.0') ? s.substring(0, s.length - 2) : s;
    return '$cleaned Tk';
  }


  double get subtotal {
    double sum = 0;
    for (final item in cartItemModelData) {
      final q = quantities[item.id]?.value ?? (item.quantity ?? 1);
      final unit = (item.food.price is int)
          ? (item.food.price as int).toDouble()
          : (item.food.price as double);
      sum += (unit * q);
    }
    return sum;
  }

  double get vatAmount => (subtotal * vatRate);
  double get total => subtotal + deliveryFee + platformFee + vatAmount;

  Future<bool> getCartListData() async {
    cartInProgress = true;
    update();
    try {
      final response =
      await CartListApiServices.cartListApiRequest(Urls.cartList);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body) as List<dynamic>;
        cartItemModelData = decoded.map((e) => CartItem.fromJson(e)).toList();

        final currentIds = cartItemModelData.map((e) => e.id).toSet();

        for (final item in cartItemModelData) {
          quantities[item.id] = (item.quantity ?? 1).obs;
        }
        quantities.removeWhere((key, _) => !currentIds.contains(key));

        update();
        update(['totals']);
        return true;
      } else {
        return false;
      }
    } catch (_) {
      return false;
    } finally {
      cartInProgress = false;
      update();
    }
  }


  int qtyOf(int itemId) => quantities[itemId]?.value ?? 1;

  void increment(int itemId) {
    final q = quantities[itemId];
    if (q == null) return;
    q.value++;
    update(['item_$itemId', 'totals']);
  }

  void decrement(int itemId) {
    final q = quantities[itemId];
    if (q == null) return;
    if (q.value > 1) {
      q.value--;
      update(['item_$itemId', 'totals']);
    }
  }


  void setFees({double? delivery, double? platform, double? vat}) {
    if (delivery != null) deliveryFee = delivery;
    if (platform != null) platformFee = platform;
    if (vat != null) vatRate = vat;
    update(['totals']);
  }


  void removeItem(int itemId) {
    cartItemModelData.removeWhere((e) => e.id == itemId);
    quantities.remove(itemId);
    update();
    update(['totals']);
  }

  @override
  void onInit() {
    super.onInit();
    getCartListData();
  }


  Future<void> deleteCartData(int cartId) async {
    deleteInProgress = true;
    update();

    try {
      final response = await CartListApiServices.deleteCartApiRequest(
        Urls.deleteCart(cartId),
      );

      deleteInProgress = false;

      if (response.statusCode == 200) {

        cartItemModelData.removeWhere((item) => item.id == cartId);

        update();
        Get.snackbar('Success', 'Deleted from cart successfully');
      } else {
        update();
        Get.snackbar('Failed', response.body);
      }
    } catch (e) {
      deleteInProgress = false;
      update();
      Get.snackbar('Failed', '$e');
    }
  }


}
