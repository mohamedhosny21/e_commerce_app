import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/business_logic_layer/cubit/localization_cubit/localization_cubit.dart';
import 'package:home_slice/generated/l10n.dart';

import '../../../constants/colors.dart';
import '../../../constants/dimensions.dart';
import '../../../constants/styles.dart';

class ArabicLanguage extends StatelessWidget {
  final String language;
  const ArabicLanguage({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        language == 'Arabic'
            ? Icon(
                Icons.check_circle,
                color: MyColors.navyBlue,
                size: 18.w,
              )
            : Icon(Icons.check_circle_outline,
                size: 18.w, color: MyColors.navyBlue),
        AppDimensions.horizontalSpacing10,
        Text(context.read<LocaleCubit>().generateCountryFlag('SA'),
            style: MyTextStyles.font18NavyBlueBold),
        AppDimensions.horizontalSpacing10,
        Text(
          S.of(context).Arabic,
          style: MyTextStyles.font18NavyBlueBold,
        ),
      ],
    );
  }
}
