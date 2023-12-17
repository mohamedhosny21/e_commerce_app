import 'package:flutter/material.dart';

class AppDimensions {
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

  static const SizedBox verticalSpacingDefault = SizedBox(
    height: 20,
  );
  static const SizedBox verticalSpacingSmall = SizedBox(
    height: 10,
  );
  static const SizedBox verticalSpacingMedium = SizedBox(
    height: 15,
  );
  static const SizedBox verticalSpacingExtraSmall = SizedBox(
    height: 5,
  );
  static const SizedBox verticalSpacingLarge = SizedBox(
    height: 30,
  );
  static const SizedBox verticalSpacingExtraLarge = SizedBox(
    height: 60,
  );
  static const SizedBox verticalSpacingExtraExtraLarge = SizedBox(
    height: 65,
  );
  static const SizedBox horizontalSpacingS = SizedBox(
    width: 5,
  );
  static const SizedBox horizontalSpacingDefault = SizedBox(
    width: 10,
  );
  static const SizedBox horizontalSpacingMedium = SizedBox(
    width: 20,
  );
  static const EdgeInsetsGeometry paddingAll = EdgeInsetsDirectional.all(8.0);
  static const EdgeInsetsGeometry paddingStart =
      EdgeInsetsDirectional.only(start: 10);
  static const EdgeInsetsGeometry paddingTop =
      EdgeInsetsDirectional.only(top: 5);
  static const EdgeInsetsGeometry paddingFromSTEB =
      EdgeInsetsDirectional.fromSTEB(30, 0, 30, 20);
}
