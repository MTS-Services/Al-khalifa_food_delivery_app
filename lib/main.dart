// main.dart
import 'package:al_khalifa/app_management.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // GetStorage initialization
  await GetStorage.init();

  // Hive initialization
  await Hive.initFlutter();
  await Hive.openBox('app_data');

  // ✅ সরাসরি AppManagement run করুন
  runApp(AppManagement());
}