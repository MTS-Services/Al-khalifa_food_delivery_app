import 'dart:convert';

import 'package:al_khalifa/app/api_services/utility/urls.dart';
import 'package:al_khalifa/app/modules/notification/model/notification_model.dart';
import 'package:get/get.dart';

import '../../../api_services/notifications/all_notifications.dart';

class NotificationController extends GetxController {
  bool notificationInProgress=false;
  bool deleteNotificationInProgress=false;
  List<NotificationModel> notificationList=[];

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
                          


  @override
  void onInit() {
    getAllNotification();
    super.onInit();
  }
}
