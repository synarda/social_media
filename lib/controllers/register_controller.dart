import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:social_media/screens/login_page.dart';
import 'package:social_media/services/auth_service.dart';

class RegsiterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUp() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    AuthService().signUpWithEmail(emailController.text, passwordController.text, nameController.text).then((value) {
      Get.to(const LoginPage());
      EasyLoading.dismiss();
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
