import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/app_constants.dart';
import 'pizza_types_container_widget.dart';

class MargheritaPizzaContainer extends StatelessWidget {
  const MargheritaPizzaContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return PizzaTypesContainer(
        category: context.tr('Margharita_Pizza'),
        color: MyColors.lightGrayishBlue,
        image: AppConstants.margheritaPizzaImage);
  }
}
