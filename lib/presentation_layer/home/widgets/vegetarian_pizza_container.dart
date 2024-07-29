import 'package:flutter/cupertino.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import 'pizza_types_container_widget.dart';

class VegetarianPizzaContainer extends StatelessWidget {
  const VegetarianPizzaContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const PizzaTypesContainer(
        buttonText: 'Show Now',
        category: 'Vegetarian Pizza',
        descText: 'A collection of best tasting pizza and most popular one',
        color: MyColors.lightGreen,
        image: AppConstants.vegetarianPizzaImage);
  }
}
