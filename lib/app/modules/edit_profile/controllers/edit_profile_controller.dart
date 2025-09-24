import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../profile/controllers/profile_controller.dart';

class EditProfileController extends GetxController {
  ProfileController profileController = Get.put(ProfileController());
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  var selectedDistrict = RxnString();
  var selectedCity = RxnString();
  void onInit(){
    super.onInit();
    nameController.text = profileController.name.value;
    numberController.text = profileController.number.value;
    emailController.text = profileController.number.value;
  }

  void onClose(){
    nameController.dispose();
    numberController.dispose();
    emailController.dispose();
  }

}
