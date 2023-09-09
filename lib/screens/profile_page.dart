import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/controllers/auth_controller.dart';
import 'package:social_media/screens/create_post.dart';
import 'package:social_media/screens/my_posts.dart';
import 'package:social_media/utils/const.dart';
import 'package:social_media/widgets/profile_buttons.dart';
import 'package:social_media/widgets/profile_photo.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerAuth = Get.find<AuthController>();

    return Drawer(
      width: Get.width / 1.2,
      child: Container(
        color: Colorss.themeNeon1,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Get.height / 1.4,
                decoration: const BoxDecoration(
                    color: Colorss.backgroundColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    ProfileButtonsWidget(
                        function: () => Get.to(const CreatePostPage()),
                        txt: "Create Post",
                        iconLeft: Icons.add,
                        isNegative: false,
                        delay: 0),
                    ProfileButtonsWidget(
                        function: () => Get.to(const MyPostsPage()),
                        txt: "My Posts",
                        iconLeft: Icons.photo,
                        isNegative: false,
                        delay: 100),
                    ProfileButtonsWidget(
                        function: () => controllerAuth.signOut(),
                        txt: "Log Out",
                        iconLeft: Icons.logout,
                        isNegative: true,
                        delay: 200),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: Get.height / 1.6,
              left: (Get.width / 6),
              child: Column(
                children: [
                  Text(
                    controllerAuth.user.value?.displayName!.toUpperCase() ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: Styles.bigTitleStyle.copyWith(fontSize: 18, color: Colorss.backgroundColor),
                  ),
                  ProfilePhotoWidget(
                    name: Get.find<AuthController>().user.value!.displayName ?? "",
                    size: 200,
                    borderSize: 10,
                    iconSize: 120,
                    borderColor: Colorss.borderColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
