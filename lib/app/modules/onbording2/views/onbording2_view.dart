import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onbording2_controller.dart';

class Onbording2View extends GetView<Onbording2Controller> {
  const Onbording2View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onbording2View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Onbording2View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
