import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:social_media/services/storage_service.dart';

class ProfileController extends GetxController {
  final Storage storage = Storage();
  static FirebaseAuth userInfo = FirebaseAuth.instance;
  final downloadProfilPhotoUrl = "".obs;
}
