import 'package:flutter/material.dart';
import '../../../data_layer/models/pizza_model.dart';

import '../../../core/constants/styles.dart';

class FavoritePizzaName extends StatelessWidget {
  final PizzaModel favoriteItem;
  const FavoritePizzaName({super.key, required this.favoriteItem});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Text(
        favoriteItem.pizzaName.toString(),
        style: MyTextStyles.font20BlackBold,
        textAlign: TextAlign.center,
      ),
    );
  }
}
