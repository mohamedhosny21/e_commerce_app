import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../business_logic_layer/cart_cubit/cubit/cart_cubit.dart';
import '../../../business_logic_layer/payment_cubit/payment_cubit.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';

class MakeOrderButton extends StatelessWidget {
  const MakeOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 45.h,
      onPressed: () {
        final amount = context.read<CartCubit>().totalPrice.ceil();
        context.read<PaymentCubit>().makePayment(amount);
      },
      textColor: Colors.white,
      color: MyColors.navyBlue,
      minWidth: double.infinity,
      child: Text(
        context.tr('OrderNow'),
        style: MyTextStyles.font20WhiteBold,
      ),
    );
  }
}
