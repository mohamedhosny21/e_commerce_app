import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/core/constants/colors.dart';
import 'package:home_slice/core/constants/dimensions.dart';
import '../../core/constants/styles.dart';
import '../../core/routing/routes.dart';

class TransactionCompletedScreen extends StatelessWidget {
  const TransactionCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIconContainer(),
              AppDimensions.verticalSpacing30,
              _buildTransactionCompletedText(context),
              AppDimensions.verticalSpacing65,
              _buildGoToHomeButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildTransactionCompletedText(BuildContext context) {
    return Text(
      context.tr('Transaction_Completed'),
      style: MyTextStyles.font25NavyBlueBold,
    );
  }

  Container _buildIconContainer() {
    return Container(
        width: 100.r,
        height: 100.r,
        decoration:
            const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
        child: Icon(
          Icons.done_rounded,
          size: 90.w,
        ));
  }

  MaterialButton _buildGoToHomeButton(BuildContext context) {
    return MaterialButton(
      minWidth: 300.w,
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.homeScreen, (route) => false);
      },
      color: MyColors.navyBlue,
      child: Text(
        context.tr('Go_To_Home'),
        style: MyTextStyles.font20WhiteBold,
      ),
    );
  }
}
