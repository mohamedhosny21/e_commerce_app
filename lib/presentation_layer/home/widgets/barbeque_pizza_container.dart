import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/app_constants.dart';
import 'pizza_types_container_widget.dart';

class BBQPizzaContainer extends StatelessWidget {
  const BBQPizzaContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PizzaTypesContainer(
        category: context.tr('BBQ_Chicken_Pizza'),
        color: MyColors.alabaster,
        image: AppConstants.barbecuePizzaImage);
  }
}
