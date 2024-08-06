import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/core/utils.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/styles.dart';

class EnglishLanguage extends StatelessWidget {
  final String language;
  const EnglishLanguage({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        language == 'English'
            ? Icon(
                Icons.check_circle,
                color: MyColors.navyBlue,
                size: 18.w,
              )
            : Icon(
                Icons.check_circle_outline,
                size: 18.w,
                color: MyColors.navyBlue,
              ),
        AppDimensions.horizontalSpacing10,
        Text(Utils.generateCountryFlag('GB'),
            style: MyTextStyles.font18NavyBlueBold),
        AppDimensions.horizontalSpacing10,
        Text(
          context.tr('English'),
          style: MyTextStyles.font18NavyBlueBold,
        ),
      ],
    );
  }
}
