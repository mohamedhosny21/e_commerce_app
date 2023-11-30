import 'package:flutter/material.dart';

class MySize {
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double getScreenWidth(BuildContext context) {
    final double width =
        getScreenSize(context).width * MediaQuery.of(context).devicePixelRatio;
    return width;
  }

  static double getScreenHeight(BuildContext context) {
    final double height =
        getScreenSize(context).height * MediaQuery.of(context).devicePixelRatio;
    return height;
  }
}
