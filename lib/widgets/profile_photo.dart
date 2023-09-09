// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media/utils/const.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({
    Key? key,
    required this.size,
    required this.borderSize,
    required this.iconSize,
    required this.borderColor,
    required this.name,
  }) : super(key: key);

  final double size;
  final double borderSize;
  final double iconSize;
  final Color borderColor;
  final String name;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          decoration: BoxDecoration(
              color: Colorss.backgroundColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: borderSize,
                color: Colorss.themeNeon1,
              )),
          height: size,
          width: size,
          child: Center(
            child: Text(
              name.toString().substring(0, 1).toUpperCase(),
              style: TextStyle(color: Colorss.themeNeon1, fontSize: size / 2, fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
