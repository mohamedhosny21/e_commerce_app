import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../generated/l10n.dart';
import 'pizza_types_container_widget.dart';

class HawaiianPizzaContainer extends StatelessWidget {
  const HawaiianPizzaContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return PizzaTypesContainer(
        category: S.of(context).Hawaiian_Pizza,
        color: MyColors.water,
        image: AppConstants.hawaiianPizzaImage);
  }
}
