import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/styles.dart';
import 'delivery_fee.dart';
import 'make_order_button.dart';
import 'subtotal.dart';
import 'total_price.dart';

import '../../../core/constants/colors.dart';
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
      height: 270.h,
      child: Column(
        children: [
          Center(
            child: Text(
              context.tr('PaymentDetails'),
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
