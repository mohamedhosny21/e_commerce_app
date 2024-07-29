import 'package:flutter/cupertino.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import 'pizza_types_container_widget.dart';

class BBQPizzaContainer extends StatelessWidget {
  const BBQPizzaContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const PizzaTypesContainer(
        buttonText: 'Show Now',
        category: 'BBQ Chicken Pizza',
        descText: 'A collection of best tasting pizza and most popular one',
        color: MyColors.alabaster,
        image: AppConstants.barbecuePizzaImage);
  }
}
