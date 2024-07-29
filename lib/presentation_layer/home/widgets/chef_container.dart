import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../constants/dimensions.dart';
import '../../../constants/strings.dart';

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
