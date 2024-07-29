import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';

import '../../../business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';
import '../../../business_logic_layer/cubit/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import '../../../constants/styles.dart';

class PizzaOrderItemQuantity extends StatelessWidget {
  final PizzaModel pizzaModel;
  const PizzaOrderItemQuantity({
    super.key,
    required this.pizzaModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PizzaOrderCubit, PizzaOrderState>(
      builder: (context, state) {
        return Text(
          '${context.read<PizzaOrderCubit>().showPizzaQuantity(pizzaModel, context.read<CartCubit>().cartPizzaItems)}',
          style: MyTextStyles.font20BlackRegular,
        );
      },
    );
  }
}
