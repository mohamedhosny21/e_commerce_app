import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/app_constants.dart';

class ChefContainer extends StatelessWidget {
  const ChefContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160.h,
          decoration: BoxDecoration(
              color: MyColors.pink, borderRadius: BorderRadius.circular(30.r)),
        ),
        Padding(
          padding: AppDimensions.paddingSymmetric8,
          child: const Image(
            image: NetworkImage(AppConstants.chefImage),
          ),
        ),
      ],
    );
  }
}
