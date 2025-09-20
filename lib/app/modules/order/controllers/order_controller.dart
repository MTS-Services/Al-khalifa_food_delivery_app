import 'dart:async';

import 'package:get/get.dart';

class OrderController extends GetxController {
  Timer? _timer;
  final remainingTime = 600.obs; // 10 minutes in seconds, made observable

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (remainingTime.value < 1) {
          timer.cancel();
          // Timer finished, you can add any action here
        } else {
          remainingTime.value--;
        }
      },
    );
  }

  String get formattedTime {
    final minutes = (remainingTime.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingTime.value % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
