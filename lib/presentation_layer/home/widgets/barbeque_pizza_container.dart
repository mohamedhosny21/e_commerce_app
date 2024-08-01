import 'package:flutter/material.dart';
import 'package:home_slice/generated/l10n.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import 'pizza_types_container_widget.dart';

class BBQPizzaContainer extends StatelessWidget {
  const BBQPizzaContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PizzaTypesContainer(
        category: S.of(context).BBQ_Chicken_Pizza,
        color: MyColors.alabaster,
        image: AppConstants.barbecuePizzaImage);
  }
}
