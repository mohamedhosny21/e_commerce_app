import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import 'pizza_types_container_widget.dart';

class PeperoniPizzaContainer extends StatelessWidget {
  const PeperoniPizzaContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const PizzaTypesContainer(
        buttonText: 'Show Now',
        category: 'Pepperoni Pizza',
        descText: 'A collection of best tasting pizza and most popular one',
        color: MyColors.veryPaleBlue,
        image: AppConstants.pepperoniPizzaImage);
  }
}
