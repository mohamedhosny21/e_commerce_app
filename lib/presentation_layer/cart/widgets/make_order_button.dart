import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../constants/styles.dart';

class MakeOrderButton extends StatelessWidget {
  const MakeOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 45.h,
      onPressed: () {},
      textColor: Colors.white,
      color: MyColors.navyBlue,
      minWidth: double.infinity,
      child: Text(
        'Order Now',
        style: MyTextStyles.font20WhiteBold,
      ),
    );
  }
}
