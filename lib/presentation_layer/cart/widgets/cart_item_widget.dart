import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic_layer/cart_cubit/cubit/cart_cubit.dart';
import '../../../core/constants/styles.dart';
import '../../../data_layer/models/pizza_model.dart';
import 'cart_pizza_item.dart';
import 'cart_pizza_item_details.dart';

import '../../../core/constants/dimensions.dart';
import '../../../core/constants/app_constants.dart';

class CartItem extends StatelessWidget {
  final BuildContext context;
  final PizzaModel pizzaModel;

  const CartItem({
    super.key,
    required this.context,
    required this.pizzaModel,
  });

  @override
  Widget build(BuildContext context) {
    final List<PizzaModel> cartItems =
        BlocProvider.of<CartCubit>(context).cartPizzaItems;
    return Container(
      margin: AppDimensions.marginTop20,
      child: Card(
        color: Colors.white,
        margin: AppDimensions.marginSymmetric10,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInImage.assetNetwork(
                    width: 116,
                    height: 150,
                    placeholder: AppConstants.loadingGif,
                    image: pizzaModel.image.toString()),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppDimensions.verticalSpacing10,
                      CartPizzaItem(pizzaModel: pizzaModel),
                      AppDimensions.verticalSpacing5,
                      Padding(
                        padding: AppDimensions.paddingStart10,
                        child: Text(
                          '${pizzaModel.pizzaSize}',
                          style: MyTextStyles.font16GreyBold,
                        ),
                      ),
                      AppDimensions.verticalSpacing5,
                      CartPizzaItemDetails(
                          pizzaModel: pizzaModel, cartItems: cartItems)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
