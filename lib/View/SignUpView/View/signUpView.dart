import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:invitation_maker/View/SignUpView/Controller/signUpController.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.find<SignUpController>();
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          TextFormField(
            controller: controller.usernameController,
            decoration: const InputDecoration(),
          ),
          const Gap(5),
          TextFormField(
            controller: controller.emailController,
            decoration: const InputDecoration(),
          ),
          const Gap(5),
          Obx(() => TextFormField(
                controller: controller.passwordController,
                obscureText: controller.obsecureText.value,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                  icon: Icon(
                    controller.obsecureText.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: controller.togglePasswordVisibiliity,
                )),
              )),
          const Gap(5),
          ElevatedButton(
              onPressed: controller.signUpWithEmailAndPassword,
              child: const Text(
                "Sign Up",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ],
      ),
    ));
  }
}
