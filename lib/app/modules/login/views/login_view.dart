import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
          const SizedBox(height: 300,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your Email or Number',
              ),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){}
                  ,child: Text('Submit',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
            ),

        ],),
      ),
    );
  }
}
