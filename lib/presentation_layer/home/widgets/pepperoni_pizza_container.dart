import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../generated/l10n.dart';
import 'pizza_types_container_widget.dart';

class PeperoniPizzaContainer extends StatelessWidget {
  const PeperoniPizzaContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PizzaTypesContainer(
        category: S.of(context).Pepperoni_Pizza,
        color: MyColors.veryPaleBlue,
        image: AppConstants.pepperoniPizzaImage);
  }
}
