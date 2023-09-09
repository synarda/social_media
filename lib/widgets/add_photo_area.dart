import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/controllers/post_controller.dart';
import 'package:social_media/utils/const.dart';
import 'package:social_media/utils/helper.dart';

class AddPhotoAreaWidget extends StatelessWidget {
  const AddPhotoAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerPost = Get.find<PostController>();

    return Obx(() => GestureDetector(
          onTap: controllerPost.addPostPhoto,
          child: Container(
            height: 350,
            width: Get.width,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
                boxShadow: [Helper.boxShadow],
                borderRadius: BorderRadius.circular(20),
                color: Colorss.backgroundColor,
                border: Border.all(color: Colorss.themeNeon1, width: 1)),
            child: controllerPost.photoUrlPath.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      File(controllerPost.photoUrlPath.value),
                      fit: BoxFit.cover,
                    ),
                  )
                : Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colorss.themeNeon1,
                        size: 40,
                      ),
                      const SizedBox(height: 16),
                      Text("Add Photo", style: Styles.smallTextStyle.copyWith(fontSize: 12)),
                    ],
                  )),
          ),
        ));
  }
}
