import 'package:get/get.dart';
import 'package:invitation_maker/Services/authServices.dart';
import 'package:invitation_maker/View/SignInView/Controller/signInController.dart';
import 'package:invitation_maker/View/SignUpView/Controller/signUpController.dart';
import 'package:invitation_maker/View/SplashView/Controller/splashController.dart';

class InitialbindingsImplementation implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthServices>(() => AuthServices(), fenix: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
  }
}
