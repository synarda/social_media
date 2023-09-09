// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DarkGradientWidget extends StatelessWidget {
  const DarkGradientWidget({
    Key? key,
    this.radius = 20,
  }) : super(key: key);
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius), bottomRight: Radius.circular(radius)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.8),
            ],
          )),
    );
  }
}
