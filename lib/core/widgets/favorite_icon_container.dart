import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/core/constants/colors.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';

import '../../business_logic_layer/favorite_pizza_cubit/cubit/favorite_pizza_cubit.dart';

class FavoriteIcon extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;
  final double size;
  final PizzaModel pizzaModel;
  const FavoriteIcon(
      {super.key,
      required this.width,
      required this.height,
      this.margin,
      required this.size,
      required this.pizzaModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration:
          const BoxDecoration(color: MyColors.navyBlue, shape: BoxShape.circle),
      child: BlocBuilder<FavoritePizzaCubit, FavoritePizzaState>(
        builder: (context, state) {
          FavoritePizzaCubit favoritePizzaCubit =
              BlocProvider.of<FavoritePizzaCubit>(context);

          final bool isFavorite = favoritePizzaCubit.favoriteItems
              .any((element) => pizzaModel.id == element.id);
          return IconButton(
              alignment: Alignment.center,
              onPressed: () {
                if (isFavorite) {
                  favoritePizzaCubit.deleteFromFavoriteDatabase(
                      pizzaModel.id, pizzaModel);
                } else {
                  favoritePizzaCubit.insertIntoFavoriteDatabase(pizzaModel);
                }
              },
              icon: Icon(
                isFavorite ? Icons.favorite_sharp : Icons.favorite_border_sharp,
                color: isFavorite ? Colors.red : Colors.white,
                size: size,
              ));
        },
      ),
    );
  }
}
