import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/app_constants.dart';
import 'pizza_types_container_widget.dart';

class FourCheesePizzaContainer extends StatelessWidget {
  const FourCheesePizzaContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PizzaTypesContainer(
      category: context.tr('Four_Cheese_Pizza'),
      image: AppConstants.fourCheesePizzaImage,
      color: MyColors.yellow,
    );
  }
}
