import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/curent_location_controller.dart';

class CurentLocationView extends GetView<CurentLocationController> {
  const CurentLocationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CurentLocationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CurentLocationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
