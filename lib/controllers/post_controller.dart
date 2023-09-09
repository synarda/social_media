import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:social_media/screens/home_page.dart';
import 'package:social_media/services/create_post_service.dart';
import 'package:social_media/services/storage_service.dart';
import 'package:social_media/utils/alerts.dart';

class PostController extends GetxController {
  final Storage storage = Storage();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final photoUrlPath = "".obs;
  final photoUrlFileName = "".obs;

  void addPostPhoto() async {
    try {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
      final results = await FilePicker.platform
          .pickFiles(allowMultiple: false, type: FileType.custom, allowedExtensions: ["png", "jpg"]);
      final path = results!.files.single.path;
      final filename = results.files.single.name;
      photoUrlPath.value = path!;
      photoUrlFileName.value = filename;

      EasyLoading.dismiss();
    } catch (_) {
      Alerts.showError("ERROR");
    }
  }

//When I save a post photo, I save it with the storage feature first to get
// the url later and then I save the post after accessing the url,
//so I use image.network when I take the post.
  Future<void> save() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    if (descriptionController.text.isNotEmpty && titleController.text.isNotEmpty && photoUrlPath.value.isNotEmpty) {
      //upload image
      storage.uploadPostFile(photoUrlPath.value, photoUrlFileName.value).then((value) async {
        //download url
        final postUrl = await Storage().downloadPostURL(photoUrlFileName.value);
        EasyLoading.dismiss();
        Alerts.showAlert("Save Photo");
        EasyLoading.show(maskType: EasyLoadingMaskType.black);
        //and create post
        await PostService.createPost(descriptionController.text, titleController.text, postUrl);
        update();
        EasyLoading.dismiss();
        Alerts.showAlert("Posted");
        Get.off(const HomePage());
      });
    } else {
      Alerts.showError("Please Enter Field");
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
