import 'dart:convert';

import 'package:al_khalifa/app/api_services/profile_api_services/profile_api_services.dart';
import 'package:al_khalifa/app/api_services/utility/urls.dart';
import 'package:al_khalifa/app/modules/profile/model/profile_model.dart';
import 'package:get/get.dart';
class ProfileController extends GetxController {

  bool profileInProgress=false;
  var profileModelInfo = ProfileModel(
    id: 0,
    firstName: '',
    lastName: '',
    email: '',
    city: '',
    district: '',
    address: '',
    phoneNumber: '',
    role: '',
  ).obs;

  Future<bool> getProfileData()async{
    profileInProgress=true;
    update();
    try{
      final response=await ProfileApiServices.getProfileDataRequest(Urls.getProfile);
      profileInProgress=false;

      if(response.statusCode == 200){
        final decodedResponse=jsonDecode(response.body);
        profileModelInfo.value=ProfileModel.fromJson(decodedResponse);

        update();
        return true;
      }else{
        update();
        return false;
      }
    }catch(e){
      profileInProgress=false;
      update();
      return false;
    }
  }

 @override
  void onInit() {
    super.onInit();
    getProfileData();
  }
}
