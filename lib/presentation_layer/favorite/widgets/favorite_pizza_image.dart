import 'package:flutter/material.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';

import '../../../constants/strings.dart';

class FavoritePizzaImage extends StatelessWidget {
  final PizzaModel favoriteItem;
  const FavoritePizzaImage({super.key, required this.favoriteItem});

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
        width: 120,
        height: 120,
        placeholder: AppConstants.loadingGif,
        image: favoriteItem.image.toString());
  }
}
