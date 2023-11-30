import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar(
      {super.key,
      this.leading,
      this.actions,
      this.color,
      this.height = kToolbarHeight,
      this.onPressed,
      this.title,
      this.elevation});
  final Widget? leading;
  final List<Widget>? actions;
  final Color? color;
  final double height;
  final VoidCallback? onPressed;
  final String? title;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
        style: const TextStyle(color: MyColors.myNavyBlue),
      ),
      elevation: elevation ?? 0.0,
      backgroundColor: color ?? Colors.white,
      leading: leading ??
          IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.menu,
                size: 35.0,
                color: MyColors.myNavyBlue,
              )),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
