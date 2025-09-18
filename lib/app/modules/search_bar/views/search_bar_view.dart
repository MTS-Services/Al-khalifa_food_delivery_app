import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_bar_controller.dart';

class SearchBarView extends GetView<SearchBarController> {
  const SearchBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchBarView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchBarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
