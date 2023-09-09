import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:social_media/screens/home_page.dart';
import 'package:social_media/services/auth_service.dart';
import 'package:social_media/utils/alerts.dart';
import 'package:social_media/utils/const.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> sigIn() async {
    try {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
      await AuthService()
          .auth
          .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
          .then((value) {
        Get.off(const HomePage());
        EasyLoading.dismiss();
      });
    } on FirebaseAuthException catch (err) {
      Alerts.showError(Errors.mapIn[err.code]);
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
