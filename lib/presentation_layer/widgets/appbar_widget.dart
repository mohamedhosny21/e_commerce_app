import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/constants/styles.dart';

import '../../constants/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {super.key,
      this.leading,
      this.actions,
      this.color,
      this.onPressed,
      this.title,
      this.elevation});
  final Widget? leading;
  final List<Widget>? actions;
  final Color? color;
  final VoidCallback? onPressed;
  final String? title;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
        style: MyTextStyles.font16NavyBlueRegular,
      ),
      elevation: elevation ?? 0.0,
      backgroundColor: Colors.white,
      leading: leading ??
          IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.menu,
                size: 35.0.sp,
                color: MyColors.navyBlue,
              )),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
