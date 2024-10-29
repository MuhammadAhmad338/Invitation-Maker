import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/Services/authServices.dart';
import 'package:invitation_maker/View/MainView/View/mainView.dart';

class SignUpController extends GetxController {
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var obsecureText = true.obs;
  final AuthServices authServices = Get.find<AuthServices>();

  void togglePasswordVisibiliity() {
    obsecureText.value = !obsecureText.value;
  }

  void signUpWithEmailAndPassword() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      User? user = await authServices.emailAndPasswordSignUp(email, password);
      if (user != null) {
        // Navigate to home screen or perform any post-login actions
        Get.offAll(() => const MainView());
      }
    } else {
      Get.snackbar("Error", "Please enter email and password",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
