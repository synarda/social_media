// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/controllers/home_controller.dart';
import 'package:social_media/models/post_model.dart';
import 'package:social_media/screens/post_detail.dart';
import 'package:social_media/utils/const.dart';
import 'package:social_media/widgets/dark_gradient.dart';
import 'package:social_media/widgets/profile_photo.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({
    Key? key,
    required this.post,
  }) : super(key: key);
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final controllerHome = Get.find<HomeController>();
    return GestureDetector(
      onTap: () => Get.to(PostDetailPage(post: post, downloadUrl: controllerHome.downloadPostUrl.value)),
      child: Container(
        height: 410,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                    width: Get.width,
                    height: 410,
                    child: Image.network(post.photoUrl, fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Colorss.themeNeon1,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                            const SizedBox(height: 8),
                            Text("Loading...", style: Styles.smallTextStyle.copyWith(color: Colorss.themeNeon1))
                          ],
                        ),
                      );
                    }))),
            const DarkGradientWidget(),
            Container(
              color: Colorss.backgroundColor.withOpacity(0.5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfilePhotoWidget(
                        name: post.name, size: 50, borderSize: 2, iconSize: 25, borderColor: Colorss.borderColor),
                  ),
                  const SizedBox(width: 16),
                  Text(post.name, style: Styles.mediumTextStyle),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                width: Get.width,
                height: 100,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                  Text(post.title,
                      textAlign: TextAlign.start,
                      style:
                          Styles.mediumTextStyle.copyWith(color: Colorss.backgroundColor, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 8),
                  Text(post.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Styles.smallTextStyle.copyWith(color: Colorss.textColor)),
                  const SizedBox(height: 8),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
