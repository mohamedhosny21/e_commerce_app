import 'package:flutter/material.dart';

import '../../../core/constants/dimensions.dart';
import '../../../core/constants/styles.dart';
import '../../../data_layer/models/pizza_model.dart';

class PizzaMenuItemNameWithDescription extends StatelessWidget {
  final PizzaModel pizzaModel;
  const PizzaMenuItemNameWithDescription({super.key, required this.pizzaModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pizzaModel.pizzaName.toString(),
            style: MyTextStyles.font16NavyBlueBold,
          ),
          AppDimensions.verticalSpacing10,
          Text(
            pizzaModel.menuDescription.toString(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: MyTextStyles.font15GreyBold,
          ),
        ],
      ),
    );
  }
}
