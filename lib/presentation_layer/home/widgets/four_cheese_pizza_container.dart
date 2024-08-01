import 'package:flutter/material.dart';
import 'package:home_slice/generated/l10n.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import 'pizza_types_container_widget.dart';

class FourCheesePizzaContainer extends StatelessWidget {
  const FourCheesePizzaContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PizzaTypesContainer(
      category: S.of(context).Four_Cheese_Pizza,
      image: AppConstants.fourCheesePizzaImage,
      color: MyColors.yellow,
    );
  }
}
