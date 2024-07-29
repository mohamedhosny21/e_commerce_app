import 'package:flutter/material.dart';

import '../../../constants/styles.dart';
import '../../../data_layer/models/pizza_model.dart';

class PizzaOrderItemName extends StatelessWidget {
  final PizzaModel pizzaModel;
  const PizzaOrderItemName({
    super.key,
    required this.pizzaModel,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      pizzaModel.pizzaName,
      style: MyTextStyles.font25NavyBlueBold,
    );
  }
}
