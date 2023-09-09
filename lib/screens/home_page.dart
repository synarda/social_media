import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/controllers/auth_controller.dart';
import 'package:social_media/controllers/home_controller.dart';
import 'package:social_media/models/post_model.dart';
import 'package:social_media/screens/profile_page.dart';
import 'package:social_media/utils/const.dart';
import 'package:social_media/widgets/blank.dart';
import 'package:social_media/widgets/post_item.dart';
import 'package:social_media/widgets/profile_photo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerHome = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 80,
          leading: const SizedBox(),
          actions: [
            Builder(
              builder: (context) {
                return GestureDetector(
                    onTap: Scaffold.of(context).openEndDrawer,
                    child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 16),
                        child: ProfilePhotoWidget(
                          name: Get.find<AuthController>().user.value!.displayName ?? "",
                          size: 50,
                          borderSize: 2,
                          iconSize: 25,
                          borderColor: Colorss.borderColor,
                        )));
              },
            )
          ],
          backgroundColor: Colorss.backgroundColor,
          title: Center(
            child: Text(
              "ITU Social Media",
              style: Styles.mediumTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          )),
      endDrawer: const ProfilePage(),
      drawerScrimColor: Colors.black.withOpacity(0.8),
      backgroundColor: Colorss.backgroundColor,
      body: Center(
          child: FirestoreQueryBuilder<PostModel>(
        query: controllerHome.reference,
        pageSize: 2,
        builder: (context, snapshot, _) {
          if (snapshot.isFetching) {
            const Center(child: CupertinoActivityIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.docs.length,
              itemBuilder: (context, index) {
                final hasEndReached = snapshot.hasMore && index + 1 == snapshot.docs.length && !snapshot.isFetchingMore;
                if (hasEndReached) {
                  snapshot.fetchMore();
                }
                // snapshot.docs.sort((a, b) {
                //   return b.data().date.toDate().compareTo(a.data().date.toDate());
                // });
                final post = snapshot.docs[index].data();
                return PostItemWidget(post: post);
              },
            );
          }
          return const BlankWdiget();
        },
      )),
    );
  }
}
