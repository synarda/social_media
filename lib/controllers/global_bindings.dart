import 'package:get/get.dart';
import 'package:social_media/controllers/auth_controller.dart';
import 'package:social_media/controllers/profile_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(ProfileController());
  }
}
