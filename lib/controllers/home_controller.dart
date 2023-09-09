import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:social_media/models/post_model.dart';

class HomeController extends GetxController {
  final downloadPostUrl = "".obs;
  final user = Rxn<User>();

  //I used firebaselist to make it live and I used orderby for sorting.
  final reference = FirebaseFirestore.instance
      .collection("Post")
      .orderBy("date", descending: true)
      .withConverter<PostModel>(
          fromFirestore: (snapshot, _) => PostModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson());
}
