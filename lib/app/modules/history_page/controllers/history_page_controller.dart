
import 'dart:convert';

import 'package:al_khalifa/app/api_services/payment_history_api_services/payment_history_api_service.dart';
import 'package:al_khalifa/app/api_services/utility/urls.dart';
import 'package:al_khalifa/app/modules/history_page/model/details_history_model.dart';
import 'package:al_khalifa/app/modules/history_page/model/payment_history_model.dart';
import 'package:get/get.dart';

class HistoryPageController extends GetxController {
  List<PaymentHistoryModel>  historyModelList=[];

  Rxn<DetailsHistoryModel> detailsHistory=Rxn<DetailsHistoryModel>();
  bool paymentHistoryInProgress=false;
  bool detailsHistoryInProgress=false;

  Future<bool> getPaymentHistoryData()async{
    paymentHistoryInProgress=true;
    update();
    try{
      final response=await PaymentHistoryApiService.paymentHistoryApiRequest(Urls.paymentHistory);
      paymentHistoryInProgress=false;
      if(response.statusCode == 200){
        List<dynamic> decodedResponse=jsonDecode(response.body);
        historyModelList=decodedResponse.map((e) => PaymentHistoryModel.fromJson(e)).toList();
        update();
        return true;
      }else{

        Get.snackbar('Failed', response.body);
        update();
        return false;
      }
    }catch(e){
      paymentHistoryInProgress= false;
      update();
      Get.snackbar('Failed', "$e");
      print("e to -----${e.toString()}");
      return false;
    }
  }

  Future<bool> getDetailsHistoryData(int paymentId)async{
    detailsHistoryInProgress=true;
    update();
    try{
      final response=await PaymentHistoryApiService.paymentHistoryApiRequest(Urls.paymentDetailsHistory(paymentId));
      detailsHistoryInProgress=false;
      if(response.statusCode == 200){
       final decodedResponse=jsonDecode(response.body);
        detailsHistory.value=DetailsHistoryModel.fromJson(decodedResponse);
        update();
        return true;
      }else{

        Get.snackbar('Failed', response.body);
        update();
        return false;
      }
    }catch(e){
      detailsHistoryInProgress= false;
      update();
      Get.snackbar('Failed', "$e");
      print("e to -----${e.toString()}");
      return false;
    }
  }

  @override
  void onInit() {
    getPaymentHistoryData();
    super.onInit();
  }
}
