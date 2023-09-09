// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/controllers/auth_controller.dart';
import 'package:social_media/controllers/post_detail_controller.dart';
import 'package:social_media/models/post_model.dart';
import 'package:social_media/utils/const.dart';
import 'package:social_media/utils/helper.dart';
import 'package:social_media/widgets/dark_gradient.dart';
import 'package:social_media/widgets/profile_photo.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({
    Key? key,
    required this.post,
    required this.downloadUrl,
  }) : super(key: key);
  final PostModel post;
  final String downloadUrl;
  @override
  Widget build(BuildContext context) {
    final controllerDetail = Get.put(PostDetailController());
    return Scaffold(
      body: Stack(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              width: Get.width,
              height: Get.height / 2,
              child: Stack(
                children: [
                  SizedBox(
                      width: Get.width,
                      height: Get.height / 2,
                      child: Hero(
                        tag: post.date,
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
                                Text("Loading", style: Styles.mediumTextStyle)
                              ],
                            ),
                          );
                        }),
                      )),
                  const DarkGradientWidget(radius: 0),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ProfilePhotoWidget(
                              name: post.name,
                              size: 50,
                              borderSize: 2,
                              iconSize: 25,
                              borderColor: Colorss.borderColor,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(post.name.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: Styles.bigTextStyle
                                  .copyWith(fontWeight: FontWeight.bold, color: Colorss.backgroundColor)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child:
                  Text(post.title.toUpperCase(), style: Styles.mediumTextStyle.copyWith(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Text(post.description, style: Styles.smallTextStyle),
            )
          ]),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Row(
                  children: [
                    Text(
                      Parsers.dateTo(DateTime.parse(post.date.toDate().toString())),
                      style: Styles.smallTextStyle,
                    ),
                  ],
                ),
              )),
          Positioned(
            top: 32,
            left: 16,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colorss.backgroundColor,
              ),
            ),
          ),
          Obx(
            () => Get.find<AuthController>().user.value?.email == post.email
                ? Positioned(
                    top: 32,
                    right: 16,
                    child: IconButton(
                      onPressed: () => controllerDetail.deletePost(post.uid),
                      icon: const Icon(
                        Icons.delete,
                        color: Colorss.backgroundColor,
                      ),
                    ),
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
