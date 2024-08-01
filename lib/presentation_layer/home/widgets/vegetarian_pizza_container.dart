import 'package:flutter/cupertino.dart';
import 'package:home_slice/generated/l10n.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import 'pizza_types_container_widget.dart';

class VegetarianPizzaContainer extends StatelessWidget {
  const VegetarianPizzaContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PizzaTypesContainer(
        category: S.of(context).Vegan_Pizza,
        color: MyColors.lightGreen,
        image: AppConstants.vegetarianPizzaImage);
  }
}
