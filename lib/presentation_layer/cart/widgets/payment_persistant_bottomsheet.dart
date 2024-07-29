import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/constants/dimensions.dart';
import 'package:home_slice/constants/styles.dart';
import 'package:home_slice/presentation_layer/cart/widgets/delivery_fee.dart';
import 'package:home_slice/presentation_layer/cart/widgets/make_order_button.dart';
import 'package:home_slice/presentation_layer/cart/widgets/subtotal.dart';
import 'package:home_slice/presentation_layer/cart/widgets/total_price.dart';

import '../../../constants/colors.dart';
import 'total_items.dart';

class PaymentPersistantBottomSheet extends StatelessWidget {
  const PaymentPersistantBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      padding: AppDimensions.paddingSymmetricH10V20,
      height: 260.h,
      child: Column(
        children: [
          Center(
            child: Text(
              'Payment Details',
              style: MyTextStyles.font20NavyBlueBold,
            ),
          ),
          const TotalItems(),
          const SubTotal(),
          const DeliveryFee(),
          Expanded(
            child: Container(
              margin: AppDimensions.marginTop30,
              child: const Divider(
                color: MyColors.navyBlue,
                thickness: 2,
              ),
            ),
          ),
          const TotalPrice(),
          AppDimensions.verticalSpacing20,
          const MakeOrderButton()
        ],
      ),
    );
  }
}
