// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:social_media/utils/const.dart';
import 'package:social_media/utils/helper.dart';

class ProfileButtonsWidget extends StatelessWidget {
  const ProfileButtonsWidget({
    Key? key,
    required this.function,
    required this.txt,
    required this.iconLeft,
    required this.isNegative,
    required this.delay,
  }) : super(key: key);
  final Function() function;
  final String txt;
  final IconData iconLeft;
  final bool isNegative;
  final int delay;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: AnimatedContainer(
        duration: 500.ms,
        height: 60,
        width: Get.width,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
        decoration: BoxDecoration(
            boxShadow: [Helper.boxShadow],
            borderRadius: BorderRadius.circular(20),
            color: isNegative ? Colors.red.withOpacity(0.6) : Colorss.themeNeon1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              iconLeft,
              color: Colorss.backgroundColor,
            ),
            Text(txt,
                textAlign: TextAlign.center, style: Styles.mediumTextStyle.copyWith(color: Colorss.backgroundColor)),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colorss.backgroundColor,
            )
          ],
        ),
      ),
    ).animate().move(begin: const Offset(500, 0), delay: delay.ms, duration: 1200.ms, curve: Curves.easeInOutQuart);
  }
}
