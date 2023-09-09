import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth userInfo = FirebaseAuth.instance;
  static Future<String?> createPost(String description, String title, String photoUrl) async {
    final docRefAll = firestore.collection("Post").doc();
    final uid = docRefAll.id;

    try {
      await docRefAll.set({
        "email": userInfo.currentUser!.email,
        "title": title,
        "description": description,
        "uid": docRefAll.id,
        "photoUrl": photoUrl,
        "name": userInfo.currentUser!.displayName,
        "date": DateTime.now()
      });
    } catch (_) {
      return null;
    }
    return uid;
  }

  static Future<String?> deletePost(String uid) async {
    final docRefAll = firestore.collection("Post").doc(uid);
    try {
      await docRefAll.delete();
    } catch (_) {
      return null;
    }
    return uid;
  }
}
