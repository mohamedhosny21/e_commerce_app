import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic_layer/favorite_pizza_cubit/cubit/favorite_pizza_cubit.dart';
import '../../../data_layer/models/pizza_model.dart';

import '../../../core/constants/colors.dart';

class UnfavoriteButton extends StatelessWidget {
  final PizzaModel favoriteItem;
  const UnfavoriteButton({super.key, required this.favoriteItem});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
                color: MyColors.navyBlue,
                shape: BoxShape.circle,
                border: Border.all()),
            child: IconButton(
                onPressed: () {
                  context.read<FavoritePizzaCubit>().deleteFromFavoriteDatabase(
                      favoriteItem.id, favoriteItem);
                },
                icon: const Icon(
                  Icons.favorite_sharp,
                  color: Colors.red,
                  size: 30,
                ))));
  }
}
