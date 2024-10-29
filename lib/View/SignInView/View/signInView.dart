import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/View/SignInView/Controller/signInController.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.find<SignInController>();
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          TextFormField(
            controller: controller.emailController,
            decoration: const InputDecoration(),
          ),
          const Gap(5),
          TextFormField(
            controller: controller.passwordController,
            obscureText: controller.obsecureText.value,
            decoration: const InputDecoration(),
          ),
          ElevatedButton(
              onPressed: controller.signInWithEmailAndPassword,
              child: const Text(
                "Sign In",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ],
      ),
    ));
  }
}
