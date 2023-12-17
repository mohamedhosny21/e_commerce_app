import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';
import 'package:home_slice/business_logic_layer/cubit/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/presentation_layer/widgets/pizza_order_widgets.dart';

import '../../constants/dimensions.dart';
import '../../constants/strings.dart';

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
    PizzaOrderCubit pizzaOrderCubit = BlocProvider.of<PizzaOrderCubit>(context);
    List<PizzaModel> cartItems =
        BlocProvider.of<CartCubit>(context).cartPizzaItems;
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 10),
      child: Card(
        margin: const EdgeInsetsDirectional.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInImage.assetNetwork(
                    width: 116,
                    height: 150,
                    placeholder: loadingGif,
                    image: pizzaModel.image.toString()),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppDimensions.verticalSpacingSmall,
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              pizzaModel.pizzaName.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          IconButton(
                            alignment: Alignment.topRight,
                            onPressed: () {
                              BlocProvider.of<CartCubit>(context)
                                  .deleteFromCartDatabase(pizzaModel);
                            },
                            icon: const Icon(Icons.cancel),
                            iconSize: 20,
                          ),
                        ],
                      ),
                      AppDimensions.verticalSpacingExtraSmall,
                      Padding(
                        padding: AppDimensions.paddingStart,
                        child: Text(
                          '${pizzaModel.pizzaSize}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 16),
                        ),
                      ),
                      AppDimensions.verticalSpacingExtraSmall,
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: AppDimensions.paddingStart,
                              child:
                                  BlocBuilder<PizzaOrderCubit, PizzaOrderState>(
                                builder: (context, state) {
                                  return Text(
                                    '\$ ${pizzaOrderCubit.showPizzaPrice(pizzaModel, cartItems).toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 16),
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: buildAddAndRemoveContainer(
                                color: Colors.grey.shade100,
                                onPressed: () {
                                  pizzaOrderCubit.decrementPizzaOrder(
                                      cartItems,
                                      pizzaOrderCubit.showPizzaQuantity(
                                          pizzaModel, cartItems),
                                      pizzaModel);
                                  BlocProvider.of<CartCubit>(context)
                                      .updateToCartDatabase(pizzaModel);
                                },
                                icon: Icons.remove),
                          ),
                          Expanded(
                            child:
                                BlocBuilder<PizzaOrderCubit, PizzaOrderState>(
                              builder: (context, state) {
                                return Text(
                                  '${pizzaOrderCubit.showPizzaQuantity(pizzaModel, cartItems)}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: buildAddAndRemoveContainer(
                                color: Colors.grey.shade100,
                                onPressed: () {
                                  pizzaOrderCubit.incrementPizzaOrder(
                                      cartItems,
                                      pizzaOrderCubit.showPizzaQuantity(
                                          pizzaModel, cartItems),
                                      pizzaModel);
                                  BlocProvider.of<CartCubit>(context)
                                      .updateToCartDatabase(pizzaModel);
                                },
                                icon: Icons.add),
                          )
                        ],
                      ),
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
