import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import 'pizza_types_container_widget.dart';

class HawaiianPizzaContainer extends StatelessWidget {
  const HawaiianPizzaContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const PizzaTypesContainer(
        buttonText: 'Show Now',
        category: 'Hawaiian Pizza',
        descText: 'A collection of best tasting pizza and most popular one',
        color: MyColors.water,
        image: AppConstants.hawaiianPizzaImage);
  }
}
