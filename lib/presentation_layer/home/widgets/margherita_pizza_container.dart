import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../generated/l10n.dart';
import 'pizza_types_container_widget.dart';

class MargheritaPizzaContainer extends StatelessWidget {
  const MargheritaPizzaContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return PizzaTypesContainer(
        category: S.of(context).Margharita_Pizza,
        color: MyColors.lightGrayishBlue,
        image: AppConstants.margheritaPizzaImage);
  }
}
