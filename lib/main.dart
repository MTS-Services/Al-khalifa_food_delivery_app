import 'package:al_khalifa/app_management.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';
import 'package:device_preview/device_preview.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  await Hive.initFlutter();
  await Hive.openBox('app_data');
   runApp(AppManagement());
  /*runApp(
    AppManagement()
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => AppManagement(), // Wrap your app
    ),
  );*/
}



