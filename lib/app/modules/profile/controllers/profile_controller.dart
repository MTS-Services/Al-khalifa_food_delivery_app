import 'dart:convert';

import 'package:al_khalifa/app/api_services/profile_api_services/profile_api_services.dart';
import 'package:al_khalifa/app/api_services/utility/urls.dart';
import 'package:al_khalifa/app/modules/profile/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

  XFile ? _pickedImage;

  XFile? get pickedImage => _pickedImage;

  void setPickedImage(XFile image) {
    _pickedImage = image;
    update();
  }


  Future<void> pickImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      _pickedImage = XFile(pickedFile.path);
      update();
    }
  }


  void chooseImageFrom() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Gallery'),
                onTap: () {
                  pickImage(
                      ImageSource.gallery
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }


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
