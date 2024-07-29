import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/strings.dart';
import '../../../data_layer/models/pizza_model.dart';

class PizzaOrderItemImage extends StatelessWidget {
  final PizzaModel pizzaModel;
  const PizzaOrderItemImage({super.key, required this.pizzaModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeInImage.assetNetwork(
        placeholder: AppConstants.loadingGif,
        fit: BoxFit.fill,
        width: 300.w,
        image: pizzaModel.image,
      ),
    );
  }
}
