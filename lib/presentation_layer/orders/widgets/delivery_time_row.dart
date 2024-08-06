import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/dimensions.dart';

class DeliveryTimeRow extends StatelessWidget {
  const DeliveryTimeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: context.locale.languageCode == 'ar'
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Text(context.tr('DeliveryTime')),
          AppDimensions.horizontalSpacing10,
          const Icon(
            Icons.alarm,
            color: Colors.purple,
          ),
          AppDimensions.horizontalSpacing5,
          Text(context.tr('fifteenMin')),
        ],
      ),
    );
  }
}
