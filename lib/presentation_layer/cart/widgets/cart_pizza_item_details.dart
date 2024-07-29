import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';
import '../../../business_logic_layer/cubit/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import '../../../constants/dimensions.dart';
import '../../../constants/styles.dart';
import '../../../data_layer/models/pizza_model.dart';
import '../../widgets/add_remove_containers_widget.dart';

class CartPizzaItemDetails extends StatelessWidget {
  final PizzaModel pizzaModel;
  final List<PizzaModel> cartItems;
  const CartPizzaItemDetails(
      {super.key, required this.pizzaModel, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: AppDimensions.paddingStart10,
            child: BlocBuilder<PizzaOrderCubit, PizzaOrderState>(
              builder: (context, state) {
                return Text(
                  '\$ ${context.read<PizzaOrderCubit>().showPizzaPrice(pizzaModel, cartItems).toStringAsFixed(2)}',
                  style: MyTextStyles.font16BlackBold,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: PizzaQuantityDecrementalContainer(
              pizzaOrderCubit: context.read<PizzaOrderCubit>(),
              cartCubit: context.read<CartCubit>(),
              pizzaModel: pizzaModel),
        ),
        Expanded(
          child: BlocBuilder<PizzaOrderCubit, PizzaOrderState>(
            builder: (context, state) {
              return Text(
                '${context.read<PizzaOrderCubit>().showPizzaQuantity(pizzaModel, cartItems)}',
                textAlign: TextAlign.center,
                style: MyTextStyles.font16BlackBold,
              );
            },
          ),
        ),
        Expanded(
          child: PizzaQuantityIncrementalContainer(
              pizzaOrderCubit: context.read<PizzaOrderCubit>(),
              cartCubit: context.read<CartCubit>(),
              pizzaModel: pizzaModel),
        )
      ],
    );
  }
}
