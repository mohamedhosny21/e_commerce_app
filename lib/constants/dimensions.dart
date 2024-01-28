import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  /// ********** Vertical Sized Box ************

  static SizedBox verticalSpacing20 = SizedBox(
    height: 20.h,
  );
  static SizedBox verticalSpacing10 = SizedBox(
    height: 10.h,
  );
  static SizedBox verticalSpacing15 = SizedBox(
    height: 15.h,
  );
  static SizedBox verticalSpacing5 = SizedBox(
    height: 5.h,
  );
  static SizedBox verticalSpacing30 = SizedBox(
    height: 30.h,
  );
  static SizedBox verticalSpacing60 = SizedBox(
    height: 60.h,
  );
  static SizedBox verticalSpacing65 = SizedBox(
    height: 65.h,
  );

  /// ********** Horizontal Sized Box ************

  static SizedBox horizontalSpacing5 = SizedBox(
    width: 5.w,
  );
  static SizedBox horizontalSpacing10 = SizedBox(
    width: 10.w,
  );
  static SizedBox horizontalSpacing20 = SizedBox(
    width: 20.w,
  );

  /// ********** Padding ************

  static EdgeInsetsGeometry paddingSymmetric8 =
      EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 8.h);

  static EdgeInsetsGeometry paddingSymmetric6 =
      EdgeInsetsDirectional.symmetric(horizontal: 6.w, vertical: 6.h);

  static EdgeInsetsGeometry paddingSymmetric10 =
      EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 10.h);

  static EdgeInsetsGeometry paddingSymmetricH30V10 =
      EdgeInsetsDirectional.symmetric(horizontal: 30.w, vertical: 10.h);

  static EdgeInsetsGeometry paddingSymmetricH10V20 =
      EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 20.h);

  static EdgeInsetsGeometry paddingStart10 =
      EdgeInsetsDirectional.only(start: 10.w);

  static EdgeInsetsGeometry paddingTop4 = EdgeInsetsDirectional.only(top: 4.h);

  static EdgeInsetsGeometry paddingFromSTEB_30_0_30_20 =
      EdgeInsetsDirectional.fromSTEB(30.w, 0.h, 30.w, 20.h);

  static EdgeInsetsGeometry paddingFromSTEB_25_20_30_18 =
      EdgeInsetsDirectional.fromSTEB(25.w, 20.h, 30.w, 18.h);

  /// ********** Margin ************

  static EdgeInsetsGeometry marginTop20 = EdgeInsetsDirectional.only(top: 10.h);

  static EdgeInsetsGeometry marginTop145 =
      EdgeInsetsDirectional.only(top: 145.h);

  static EdgeInsetsGeometry marginTop30 = EdgeInsetsDirectional.only(top: 30.h);

  static EdgeInsetsGeometry marginSymmetric10 =
      EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 10.h);

  static EdgeInsetsGeometry marginSymmetricH20V10 =
      EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 10.h);

  static EdgeInsetsGeometry marginStart20End10 =
      EdgeInsetsDirectional.only(start: 20.w, end: 10.w);

  static EdgeInsetsGeometry marginStart10End20 =
      EdgeInsetsDirectional.only(start: 10.w, end: 20.w);

  static EdgeInsetsGeometry marginFromSTEB_20_0_20_10 =
      EdgeInsetsDirectional.fromSTEB(20.w, 0.h, 20.w, 10.h);
}
