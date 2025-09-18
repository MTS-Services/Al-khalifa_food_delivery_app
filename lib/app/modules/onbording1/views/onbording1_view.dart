import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onbording1_controller.dart';

class Onbording1View extends GetView<Onbording1Controller> {
  const Onbording1View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onbording1View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Onbording1View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
