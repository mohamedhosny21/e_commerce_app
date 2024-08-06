import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/app_constants.dart';
import 'pizza_types_container_widget.dart';

class PeperoniPizzaContainer extends StatelessWidget {
  const PeperoniPizzaContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PizzaTypesContainer(
        category: context.tr('Pepperoni_Pizza'),
        color: MyColors.veryPaleBlue,
        image: AppConstants.pepperoniPizzaImage);
  }
}
