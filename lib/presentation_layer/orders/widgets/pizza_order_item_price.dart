import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';

import '../../../business_logic_layer/cart_cubit/cubit/cart_cubit.dart';
import '../../../business_logic_layer/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import '../../../core/constants/styles.dart';

class PizzaOrderItemPrice extends StatelessWidget {
  final PizzaModel pizzaModel;
  const PizzaOrderItemPrice({super.key, required this.pizzaModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: BlocBuilder<PizzaOrderCubit, PizzaOrderState>(
            builder: (context, state) {
              return Text(
                '\$ ${context.read<PizzaOrderCubit>().showPizzaPrice(pizzaModel, context.read<CartCubit>().cartPizzaItems).toStringAsFixed(2)}',
                style: MyTextStyles.font25BlackBold,
              );
            },
          ),
        );
      },
    );
  }
}
