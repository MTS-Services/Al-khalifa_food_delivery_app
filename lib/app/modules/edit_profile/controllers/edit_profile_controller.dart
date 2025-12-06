import 'package:al_khalifa/app/api_services/profile_api_services/profile_api_services.dart';
import 'package:al_khalifa/app/modules/home/controllers/home_controller.dart';
import 'package:al_khalifa/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../api_services/utility/urls.dart';
import '../../profile/controllers/profile_controller.dart';

class EditProfileController extends GetxController {
  ProfileController profileController = Get.put(ProfileController());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  var selectedDistrict = RxnString();
  var selectedCity = RxnString();

  @override
  void onInit(){
    super.onInit();
    firstNameController.text = profileController.profileModelInfo.value.firstName;
    lastNameController.text = profileController.profileModelInfo.value.lastName;
    numberController.text = profileController.profileModelInfo.value.phoneNumber;
    emailController.text =profileController.profileModelInfo.value.email;
    addressController.text =profileController.profileModelInfo.value.address;
  }

  void onClose(){
    firstNameController.dispose();
    lastNameController.dispose();
    numberController.dispose();
    emailController.dispose();
  }

  bool editProfileInProgress=false;
  Future<void> getEditData()async{
    editProfileInProgress=true;
    update();
    try{
      final response=await ProfileApiServices.editProfileRequest(Urls.editProfile, <String,dynamic>{
          "first_name":firstNameController.text.trim(),
          "last_name":lastNameController.text.trim(),
          "email":emailController.text.trim(),
          "city": "string",
          "district": "string",
          "address":addressController.text.trim(),
          "phone_number": numberController.text.trim(),
          "role": "customer",
          "id": 0

      });
      editProfileInProgress=false;
      update();
      print(response.body);
      print(response.statusCode);
      if(response.statusCode == 201){
        Get.snackbar('Success', "Update Completed");
        profileController.getProfileData();
        Get.offAllNamed(Routes.CUSTOM_BOTTOOM_BAR,arguments: {"index":3});
      }else{
        Get.snackbar('Failed', "${response.body}");
      }
    }catch(e){
      editProfileInProgress=false;
      update();
      Get.snackbar('Failed Request', '$e');
    }
  }
}
