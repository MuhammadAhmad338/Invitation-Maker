import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_picker/image_picker.dart';

class InvitationController extends GetxController {
  // Controllers
  final textController = TextEditingController();

  // Variables for managing UI state
  final backgroundColor = Colors.white.obs;
  final selectedImage = Rx<XFile?>(null);
  final screenshotController = ScreenshotController();

  // Update background color
  void updateBackgroundColor(Color color) {
    backgroundColor.value = color;
  }

  // Pick an image from gallery
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = image;
    }
  }

  // Save invitation as an image
  Future<void> saveInvitation() async {
    final image = await screenshotController.capture();
    if (image != null) {
      // Add logic to save or share the image
      Get.snackbar("Success", "Invitation saved successfully!");
    } else {
      Get.snackbar("Error", "Failed to save invitation.");
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
