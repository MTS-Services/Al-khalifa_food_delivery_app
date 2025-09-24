import 'dart:convert';

import 'package:al_khalifa/app/api_services/menu_api_services/menu_api_services.dart';
import 'package:al_khalifa/app/api_services/utility/urls.dart';
import 'package:al_khalifa/app/modules/home/models/all_menu_model.dart';
import 'package:al_khalifa/app/modules/home/models/popular_food_item_model.dart';
import 'package:get/get.dart';

import '../../../api_services/popular_food_api_services/popular_food_api_services.dart';

class HomeController extends GetxController {
  bool menuInProgress = false;
  bool popularDataInProgress=false;
  List<AllMenuModel> allMenuModelList = [];
  List<PopularFoodItemModel> popularFoodItemList=[];


  Future<bool> getAllMenu() async {
    menuInProgress = true;
    update();
    try {
      final response = await MenuApiServices.getAllMenuRequest(Urls.allMenu);
      menuInProgress = false;
      print(response.body);
      print(response.statusCode);
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
      menuInProgress=false;
      update();
      print("error is $e");
      return false;
    }
  }

  Future<bool> getPopularData()async{
    popularDataInProgress=true;
    update();
    try{
      final response=await PopularFoodApiServices.getPopularItemRequest(Urls.popularFoodData);
      popularDataInProgress=false;
      print(response.body);
      print(response.statusCode);
      if(response.statusCode == 200){
        List<dynamic> decodedResponse=jsonDecode(response.body);
        popularFoodItemList=decodedResponse.map((e) => PopularFoodItemModel.fromJson(e)).toList();
        update();
        return true;
      }else{
        update();
        return false;
      }
    }catch(e){
      menuInProgress=false;
      update();
      print("error is $e");
      return false;
    }
  }


  @override
  void onInit() {
    getAllMenu();
    getPopularData();
    super.onInit();
  }
}
