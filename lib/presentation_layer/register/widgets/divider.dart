import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class DividerWidget extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  const DividerWidget({super.key, required this.margin});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: margin,
        height: 2,
        color: MyColors.navyBlue,
      ),
    );
  }
}
