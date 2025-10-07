import 'dart:convert';
import 'package:al_khalifa/app/api_services/add_to_cart_services/add_to_cart_services.dart';
import 'package:al_khalifa/app/api_services/menu_api_services/menu_api_services.dart';
import 'package:al_khalifa/app/api_services/utility/urls.dart';
import 'package:al_khalifa/app/modules/cart/controllers/cart_controller.dart';
import 'package:al_khalifa/app/modules/home/models/all_menu_model.dart';
import 'package:al_khalifa/app/modules/home/models/popular_food_item_model.dart';
import 'package:al_khalifa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api_services/popular_food_api_services/popular_food_api_services.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getAllMenu();
    getPopularData();
    super.onInit();
  }

  bool menuInProgress = false;
  bool popularDataInProgress = false;
  bool addToCartInProgress = false;
  List<AllMenuModel> allMenuModelList = [];
  List<PopularFoodItemModel> popularFoodItemList = [];

  Future<bool> getAllMenu() async {
    menuInProgress = true;
    update();
    try {
      final response = await MenuApiServices.getAllMenuRequest(Urls.allMenu);
      menuInProgress = false;
      if (response.statusCode == 200) {
        List<dynamic> decodedResponse = jsonDecode(response.body);
        allMenuModelList = decodedResponse
            .map((e) => AllMenuModel.fromJson(e))
            .toList();
        update();
        return true;
      } else {
        update();
        return false;
      }
    } catch (e) {
      menuInProgress = false;
      update();
      print("error is $e");
      return false;
    }
  }

  Future<bool> getPopularData() async {
    popularDataInProgress = true;
    update();
    try {
      final response = await PopularFoodApiServices.getPopularItemRequest(
        Urls.popularFoodData,
      );
      popularDataInProgress = false;
      if (response.statusCode == 200) {
        List<dynamic> decodedResponse = jsonDecode(response.body);
        popularFoodItemList = decodedResponse
            .map((e) => PopularFoodItemModel.fromJson(e))
            .toList();
        update();
        return true;
      } else {
        update();
        return false;
      }
    } catch (e) {
      menuInProgress = false;
      update();
      print("error is $e");
      return false;
    }
  }

  Future<void> getAddToCart(int productId, int quantity) async {
    addToCartInProgress = true;
    update();
    try {
      final response = await AddToCartServices.addToCartServices(
        Urls.addCart,
        <String, dynamic>{"product_id": productId, "quantity": quantity},
      );
      addToCartInProgress = false;
      update();
      print(response.statusCode);
      print('${response.body}');
      if (response.statusCode == 201) {
        Get.snackbar(
          'Success',
          'Data Add To Cart successful',
          backgroundColor: Colors.green.shade100,
        );
         final cart = Get.find<CartController>();
         await cart.getCartListData();
         Get.toNamed(Routes.CART);
      } else {
        Get.snackbar(
          'Failed',
          '${response.body}',
          backgroundColor: Colors.red.shade400,
        );
      }
    } catch (e) {
      addToCartInProgress = false;
      update();
      Get.snackbar('Error', 'Something went wrong: ${e.toString()}');
    }
  }


  final Map<int, RxInt> _counts = {};


  int? _currentProductId;


  void setProduct(int productId) {
    _currentProductId = productId;
    _counts.putIfAbsent(productId, () => 1.obs);
  }


  RxInt get count {
    final id = _currentProductId;
    if (id == null) return 1.obs; // safety
    return _counts[id]!;
  }

  void increment() {
    final id = _currentProductId;
    if (id == null) return;
    _counts[id]!.value++;
  }

  void decrement() {
    final id = _currentProductId;
    if (id == null) return;
    if (_counts[id]!.value > 1) {
      _counts[id]!.value--;
    }
  }

}
