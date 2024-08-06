import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/dimensions.dart';
import '../../../core/constants/styles.dart';

class PizzaSizeContainer extends StatelessWidget {
  final Color color;
  final String size;
  final VoidCallback ontap;
  const PizzaSizeContainer(
      {super.key,
      required this.color,
      required this.size,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: AppDimensions.paddingSymmetric6,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.grey.shade400)),
        child: Text(
          size,
          style: MyTextStyles.font14BlackBold,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
