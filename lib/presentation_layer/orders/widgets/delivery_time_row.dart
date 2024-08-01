import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/localization_cubit/localization_cubit.dart';
import 'package:home_slice/generated/l10n.dart';

import '../../../constants/dimensions.dart';

class DeliveryTimeRow extends StatelessWidget {
  const DeliveryTimeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: context.read<LocaleCubit>().isArabic()
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Text(S.of(context).DeliveryTime),
          AppDimensions.horizontalSpacing10,
          const Icon(
            Icons.alarm,
            color: Colors.purple,
          ),
          AppDimensions.horizontalSpacing5,
          Text(S.of(context).fifteenMin),
        ],
      ),
    );
  }
}
