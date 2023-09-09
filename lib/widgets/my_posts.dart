// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/models/post_model.dart';
import 'package:social_media/screens/post_detail.dart';
import 'package:social_media/utils/const.dart';
import 'package:social_media/widgets/dark_gradient.dart';

class MyPostListItemWidget extends StatelessWidget {
  const MyPostListItemWidget({
    Key? key,
    required this.index,
    required this.post,
  }) : super(key: key);
  final int index;
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(PostDetailPage(post: post, downloadUrl: post.photoUrl)),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Hero(
              tag: post.date,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: Get.width,
                  child: Image.network(
                    post.photoUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const DarkGradientWidget(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  post.title,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.mediumTextStyle.copyWith(color: Colorss.backgroundColor),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colorss.backgroundColor.withOpacity(0.6),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                ),
                child:
                    Text((index + 1).toString(), style: Styles.mediumTextStyle.copyWith(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
