import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/app_constants.dart';
import 'pizza_types_container_widget.dart';

class HawaiianPizzaContainer extends StatelessWidget {
  const HawaiianPizzaContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return PizzaTypesContainer(
        category: context.tr('Hawaiian_Pizza'),
        color: MyColors.water,
        image: AppConstants.hawaiianPizzaImage);
  }
}
