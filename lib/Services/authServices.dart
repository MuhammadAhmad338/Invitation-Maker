import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Observable for user state
  Rxn<User?> firebaseUser = Rxn<User?>();

  @override
  void onInit() {
    super.onInit();
    // Bind the authStateChanges stream to the firebaseUser observable
    firebaseUser.bindStream(_firebaseAuth.authStateChanges());
  }

  User? _userFromFirebaseUser(User? user) {
    return user;
  }

  Future<User?> emailAndPasswordSignIn(String? email, String? password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email!, password: password!);
      User? user = result.user;
      firebaseUser.value = user;

      if (user != null) {
        //  Get.offAll(() => const Mainview()); // Navigate to BottomNavScreen
      }

      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (error) {
      Get.snackbar("Error", error.message ?? "Some error occurred");
      return null;
    }
  }

  Future<User?> emailAndPasswordSignUp(String? email, String? password) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email!, password: password!);
      User? user = result.user;
      firebaseUser.value = user;

      if (user != null) {
        // Get.offAll(() => const Mainview()); // Navigate to BottomNavScreen
      }

      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (error) {
      Get.snackbar("Error", error.message ?? "Some error occurred");
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      firebaseUser.value = null;
      //Get.offAll(() => Signinview()); // Navigate to SignInView after sign out
    } catch (error) {
      Get.snackbar("Error", error.toString());
    }
  }
}
