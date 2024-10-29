import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:invitation_maker/Services/authServices.dart';
import 'package:invitation_maker/View/MainView/View/mainView.dart';

class SignInController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  // Instance of AuthServices
  final AuthServices authServices = Get.find<AuthServices>();
  var obsecureText = true.obs;

  void signInWithEmailAndPassword() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      User? user = await authServices.emailAndPasswordSignIn(email, password);
      if (user != null) {
        // Navigate to home screen or perform any post-login actions
        Get.offAll(() => const MainView());
      }
    } else {
      Get.snackbar("Error", "Please enter email and password",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signInWithGoogle() {}
}
