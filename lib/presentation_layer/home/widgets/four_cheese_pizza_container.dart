import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import 'pizza_types_container_widget.dart';

class FourCheesePizzaContainer extends StatelessWidget {
  const FourCheesePizzaContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const PizzaTypesContainer(
      buttonText: 'Show Now',
      category: 'Four Cheese Pizza',
      descText: 'A collection of best tasting pizza and most popular one',
      image: AppConstants.fourCheesePizzaImage,
      color: MyColors.yellow,
    );
  }
}
