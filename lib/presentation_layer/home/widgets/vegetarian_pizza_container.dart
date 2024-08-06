import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/app_constants.dart';
import 'pizza_types_container_widget.dart';

class VegetarianPizzaContainer extends StatelessWidget {
  const VegetarianPizzaContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PizzaTypesContainer(
        category: context.tr('Vegan_Pizza'),
        color: MyColors.lightGreen,
        image: AppConstants.vegetarianPizzaImage);
  }
}
