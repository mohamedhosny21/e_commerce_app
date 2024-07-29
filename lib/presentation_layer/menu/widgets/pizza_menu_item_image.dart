import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';

import '../../../constants/strings.dart';

class PizzaMenuItemImage extends StatelessWidget {
  final PizzaModel pizzaModel;
  const PizzaMenuItemImage({super.key, required this.pizzaModel});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: pizzaModel.id,
      child: FadeInImage.assetNetwork(
        placeholder: AppConstants.loadingGif,
        image: pizzaModel.image,
        width: 130.w,
        height: 130.h,
        fit: BoxFit.fill,
      ),
    );
  }
}
