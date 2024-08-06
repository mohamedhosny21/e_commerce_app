import 'package:flutter/material.dart';
import '../../../business_logic_layer/favorite_pizza_cubit/cubit/favorite_pizza_cubit.dart';
import '../../../data_layer/models/pizza_model.dart';

class DismissibleWidget extends StatelessWidget {
  final PizzaModel favoriteItem;
  final FavoritePizzaCubit favoritePizzaCubit;
  final Widget child;
  const DismissibleWidget(
      {super.key,
      required this.favoriteItem,
      required this.favoritePizzaCubit,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(favoriteItem.id),
        onDismissed: (direction) {
          favoritePizzaCubit.deleteFromFavoriteDatabase(
              favoriteItem.id, favoriteItem);
        },
        background: Container(
          color: Colors.red,
          child: const Icon(Icons.delete),
        ),
        child: child);
  }
}
