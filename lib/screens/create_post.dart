// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/controllers/auth_controller.dart';
import 'package:social_media/controllers/post_controller.dart';
import 'package:social_media/utils/const.dart';
import 'package:social_media/widgets/add_photo_area.dart';
import 'package:social_media/widgets/profile_photo.dart';
import 'package:social_media/widgets/textfield.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controllerAuth = Get.find<AuthController>();

    final controller = Get.put(PostController());
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            const SizedBox(height: 80),
                            Row(
                              children: [
                                ProfilePhotoWidget(
                                  name: Get.find<AuthController>().user.value!.displayName ?? "",
                                  size: 200,
                                  borderSize: 10,
                                  iconSize: 120,
                                  borderColor: Colorss.borderColor,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  controllerAuth.user.value?.displayName!.toUpperCase() ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.smallTextStyle.copyWith(color: Colorss.forebackground),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            TextfieldWidget(
                              padding: 0,
                              limit: 30,
                              obscure: false,
                              hintText: "Title",
                              labelColor: Colorss.forebackground,
                              maxLines: 1,
                              controller: controller.titleController,
                            ),
                            const SizedBox(height: 24),
                            TextfieldWidget(
                              padding: 0,
                              limit: 150,
                              obscure: false,
                              hintText: "description",
                              labelColor: Colorss.forebackground,
                              maxLines: 4,
                              controller: controller.descriptionController,
                            ),
                          ],
                        ),
                      ),
                      const AddPhotoAreaWidget(),
                      const SizedBox(height: 78),
                    ],
                  ),
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                floatingActionButton: SizedBox(
                  width: Get.width / 2,
                  child: FloatingActionButton(
                    onPressed: controller.save,
                    child: Container(
                        height: 60,
                        width: Get.width / 2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colorss.themeNeon1, borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "CREATE",
                            textAlign: TextAlign.center,
                            style: Styles.smallTextStyle.copyWith(color: Colorss.backgroundColor),
                          ),
                        )),
                  ),
                )),
            Positioned(
              top: 32,
              left: 16,
              child: IconButton(
                padding: EdgeInsets.zero,
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
        ));
  }
}
