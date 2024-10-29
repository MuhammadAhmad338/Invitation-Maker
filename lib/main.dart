import 'Const/const.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:invitation_maker/Const/appTheme.dart';
import 'package:invitation_maker/firebase_options.dart';
import 'package:invitation_maker/Bindings/initialBindings.dart';
import 'package:invitation_maker/View/SplashView/View/splashView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Const.title,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme, // Apply the single theme
      initialBinding: InitialbindingsImplementation(),
      home: const SplashView(),
    );
  }
}
