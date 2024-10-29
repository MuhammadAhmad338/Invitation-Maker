import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:invitation_maker/Const/const.dart';
import 'package:invitation_maker/View/SignUpView/View/signUpView.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    //Checking the authentication state after a slight delay to simulate a splash screen effect
    Future.delayed(const Duration(seconds: 3), () async {
      Get.to(() => const SignUpView());
    });

    return const Scaffold(
      body: Center(
        child: Text(
          Const.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
