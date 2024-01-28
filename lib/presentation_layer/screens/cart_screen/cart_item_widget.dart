import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';
import 'package:home_slice/business_logic_layer/cubit/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import 'package:home_slice/constants/styles.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/presentation_layer/widgets/add_remove_containers_widget.dart';

import '../../../constants/dimensions.dart';
import '../../../constants/strings.dart';

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
    final PizzaOrderCubit pizzaOrderCubit =
        BlocProvider.of<PizzaOrderCubit>(context);
    final CartCubit cartCubit = BlocProvider.of<CartCubit>(context);

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
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              pizzaModel.pizzaName.toString(),
                              style: MyTextStyles.font16BlackBold,
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
                      AppDimensions.verticalSpacing5,
                      Padding(
                        padding: AppDimensions.paddingStart10,
                        child: Text(
                          '${pizzaModel.pizzaSize}',
                          style: MyTextStyles.font16GreyBold,
                        ),
                      ),
                      AppDimensions.verticalSpacing5,
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: AppDimensions.paddingStart10,
                              child:
                                  BlocBuilder<PizzaOrderCubit, PizzaOrderState>(
                                builder: (context, state) {
                                  return Text(
                                    '\$ ${pizzaOrderCubit.showPizzaPrice(pizzaModel, cartItems).toStringAsFixed(2)}',
                                    style: MyTextStyles.font16BlackBold,
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: PizzaQuantityDecrementalContainer(
                                pizzaOrderCubit: pizzaOrderCubit,
                                cartCubit: cartCubit,
                                pizzaModel: pizzaModel),
                          ),
                          Expanded(
                            child:
                                BlocBuilder<PizzaOrderCubit, PizzaOrderState>(
                              builder: (context, state) {
                                return Text(
                                  '${pizzaOrderCubit.showPizzaQuantity(pizzaModel, cartItems)}',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.font16BlackBold,
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: PizzaQuantityIncrementalContainer(
                                pizzaOrderCubit: pizzaOrderCubit,
                                cartCubit: cartCubit,
                                pizzaModel: pizzaModel),
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
