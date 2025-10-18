import 'dart:convert';

import 'package:al_khalifa/app/api_services/utility/urls.dart';
import 'package:al_khalifa/app/modules/notification/model/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../api_services/notifications/all_notifications.dart';

class NotificationController extends GetxController {
  bool notificationInProgress=false;
  bool deleteNotificationInProgress=false;
  List<NotificationModel> notificationList=[];
  @override
  void onInit() {
    getAllNotification();
    super.onInit();
  }
  Future<bool> getAllNotification()async{
    notificationInProgress=true;
    update();
    try{
      final response=await Notifications.getNotificationRequest(Urls.notification);
      notificationInProgress=false;
      print(response.body);
      if(response.statusCode == 200){
        List<dynamic> decodedResponse=jsonDecode(response.body);
        notificationList=decodedResponse.map((e) => NotificationModel.fromJson(e)).toList();
        update();
        return true;
      }else{
        update();
        return false;
      }
    }catch(e){
      notificationInProgress=false;
      update();
      print("error is $e");
      return false;
    }
  }

  Future<void> getDeleteNotification(int notificationId)async{
    deleteNotificationInProgress=true;
    update();
    try{
      final response=await Notifications.deleteNotificationRequest(Urls.deleteNotificationById(notificationId));
      deleteNotificationInProgress=false;
      update();
      if(response.statusCode == 204){
        getAllNotification();
      }else{
        Get.snackbar('Failed', 'problem is ${response.body}');
      }

    }catch(e){
      deleteNotificationInProgress=false;
      update();
      Get.snackbar('Error', '$e');
    }
  }


}
