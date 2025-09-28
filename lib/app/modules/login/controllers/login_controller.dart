import 'dart:convert';
import 'dart:developer';

import 'package:al_khalifa/app/api_services/auth_api_services/auth_api_services.dart';
import 'package:al_khalifa/app/api_services/utility/urls.dart';
import 'package:al_khalifa/app/routes/app_pages.dart';
import 'package:al_khalifa/app/shared_prerf_services/shared_pref_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn=GoogleSignIn.instance;
  var isObSecure1 = true.obs;

  void togglePasswordVisibility() {
    isObSecure1.value = !isObSecure1.value;
  }

  bool signInProgress = false;
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passTEController = TextEditingController();

  Future<void> getSignIn() async {
    signInProgress = true;
    update();
    try {
      final response =
          await AuthApiServices.signInRequest(Urls.signIn, <String, dynamic>{
            "username": emailTEController.text.trim(),
            "password": passTEController.text.trim(),
          });

      signInProgress = false;
      update();
      print(response.body);
      print(response.statusCode.toString());
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        final token = decodedResponse["access_token"];
        print("token is $token");
        SharedPrefServices.saveUserToken(token);
        Get.snackbar(
          'Success',
          'Login Successful',
          backgroundColor: Colors.green.shade100,
        );
        Get.offAllNamed(Routes.CUSTOM_BOTTOOM_BAR);
      } else {
        Get.snackbar(
          'Failed',
          '${response.body}',
          backgroundColor: Colors.red.shade400,
        );
      }
    } catch (e) {
      signInProgress = false;
      update();
      Get.snackbar('Error', 'Something went wrong: ${e.toString()}');
    }
  }



  Future<bool> continueGoogleSignIn()async{
    String webClientId = '397749779909-02nqm910omsg2ohej4jr1o66sqn0fdp0.apps.googleusercontent.com';
    try{
      await googleSignIn.initialize(serverClientId: webClientId);
      GoogleSignInAccount  account = await googleSignIn.authenticate();
      GoogleSignInAuthentication googleAuth= account.authentication;
      final credential= GoogleAuthProvider.credential(
          idToken: googleAuth.idToken
      );
      await auth.signInWithCredential(credential);
      return true;
    }catch(e){
      log("Google sign in failed!$e");
      return false;
    }
  }
}
