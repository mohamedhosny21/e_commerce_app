import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/presentation_layer/favorite/widgets/favorite_widget.dart';

import '../../../business_logic_layer/cubit/favorite_pizza_cubit/cubit/favorite_pizza_cubit.dart';
import '../../../constants/dimensions.dart';
import '../../../data_layer/models/pizza_model.dart';
import '../../../routing/routes.dart';
import 'favorite_pizza_image.dart';
import 'favorite_pizza_name.dart';
import 'unfavorite_button.dart';

class FavoriteItemsListview extends StatelessWidget {
  final List<PizzaModel> favoriteItems;
  const FavoriteItemsListview({super.key, required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return DismissibleWidget(
          favoriteItem: favoriteItems[index],
          favoritePizzaCubit: context.read<FavoritePizzaCubit>(),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.pizzaOrderScreen,
                  arguments: favoriteItems[index]);
            },
            child: Container(
              margin: AppDimensions.marginTop20,
              child: Card(
                color: Colors.white,
                margin: AppDimensions.marginSymmetric10,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FavoritePizzaImage(favoriteItem: favoriteItems[index]),
                        AppDimensions.horizontalSpacing10,
                        FavoritePizzaName(favoriteItem: favoriteItems[index]),
                        UnfavoriteButton(favoriteItem: favoriteItems[index])
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: favoriteItems.length,
    );
  }
}
