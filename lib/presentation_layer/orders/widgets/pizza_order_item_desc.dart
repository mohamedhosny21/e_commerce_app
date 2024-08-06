import 'package:flutter/material.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';

import '../../../core/constants/styles.dart';

class PizzaOrderItemDesc extends StatelessWidget {
  final PizzaModel pizzaModel;
  const PizzaOrderItemDesc({super.key, required this.pizzaModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Text(
        pizzaModel.menuDescription.toString(),
        style: MyTextStyles.font16GreyBold,
      ),
    );
  }
}
