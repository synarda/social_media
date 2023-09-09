import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:social_media/models/post_model.dart';

class MyPostsController extends GetxController {
  final user = Rxn<User>();
  final reference = FirebaseFirestore.instance.collection("Post");
  final myPostsList = <PostModel>[].obs;
  static FirebaseAuth userInfo = FirebaseAuth.instance;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  //I made a list with my own posts to show that I also sort in normal lists. here I sort with the sort feature.
  Future<void> getData() async {
    final querySnapshot = await reference.get();
    myPostsList.value = querySnapshot.docs.map((doc) => PostModel.fromMap(doc.data())).toList();
    myPostsList.sort((a, b) {
      return b.date.compareTo(a.date);
    });
  }

  //I only bring shipments that are mine.
  List<PostModel> get getMyPosts => myPostsList.where((p1) => userInfo.currentUser!.email == p1.email).toList();
}
