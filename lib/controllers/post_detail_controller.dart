import 'package:get/get.dart';
import 'package:social_media/services/create_post_service.dart';
import 'package:social_media/utils/alerts.dart';

class PostDetailController extends GetxController {
  // delete post
  void deletePost(String uid) async {
    final result = await PostService.deletePost(uid);
    if (result != null) {
      Get.back();
      Alerts.showAlert("Post Deleted");
    }
  }
}
