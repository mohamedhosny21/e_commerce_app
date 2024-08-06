import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic_layer/cart_cubit/cubit/cart_cubit.dart';
import '../../../core/constants/styles.dart';
import '../../../data_layer/models/pizza_model.dart';

class CartPizzaItem extends StatelessWidget {
  final PizzaModel pizzaModel;
  const CartPizzaItem({super.key, required this.pizzaModel});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
