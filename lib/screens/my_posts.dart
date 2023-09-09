import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/controllers/auth_controller.dart';
import 'package:social_media/controllers/my_posts_controller.dart';
import 'package:social_media/utils/const.dart';
import 'package:social_media/widgets/blank.dart';
import 'package:social_media/widgets/my_posts.dart';
import 'package:social_media/widgets/profile_photo.dart';

class MyPostsPage extends StatelessWidget {
  const MyPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerMyPosts = Get.put(MyPostsController());
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                ProfilePhotoWidget(
                  name: Get.find<AuthController>().user.value!.displayName ?? "",
                  size: 200,
                  borderSize: 10,
                  iconSize: 120,
                  borderColor: Colorss.borderColor,
                ),
                Flexible(
                  child: Obx(() => controllerMyPosts.getMyPosts.isNotEmpty
                      ? GridView.builder(
                          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                          ),
                          itemCount: controllerMyPosts.getMyPosts.length,
                          itemBuilder: (contex, index) {
                            return MyPostListItemWidget(post: controllerMyPosts.myPostsList[index], index: index);
                          })
                      : const BlankWdiget()),
                ),
              ],
            ),
          ),
          Positioned(
            top: 32,
            left: 16,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colorss.forebackground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
