import 'dart:io';

import "package:firebase_core/firebase_core.dart" as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:social_media/utils/alerts.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Future<String> downloadPostInURL(String email) async {
    String downloadProfilPhotoUrl = await storage.ref("profil/photos/$email").getDownloadURL();
    return downloadProfilPhotoUrl;
  }

  //////////////////////////////////////////////////////////////
  Future<void> uploadPostFile(
    String filepath,
    String filename,
  ) async {
    File file = File(filepath);

    try {
      await storage.ref("post/photos/$filename").putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      Alerts.showError(e.toString());
    }
  }

  Future<String> downloadPostURL(String imageName) async {
    String downloadURL = await storage.ref("post/photos/$imageName").getDownloadURL();
    return downloadURL;
  }
}
