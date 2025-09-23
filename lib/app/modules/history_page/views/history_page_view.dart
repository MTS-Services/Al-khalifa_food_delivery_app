import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_page_controller.dart';

class HistoryPageView extends GetView<HistoryPageController> {
  const HistoryPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HistoryPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
