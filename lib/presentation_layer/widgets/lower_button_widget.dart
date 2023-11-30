import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';
import 'package:home_slice/business_logic_layer/cubit/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';

import '../../constants/colors.dart';

class LowerButton extends StatelessWidget {
  final PizzaModel pizzaModel;
  final int pizzaQuantity;
  final num price;
  const LowerButton({
    super.key,
    required this.pizzaModel,
    required this.pizzaQuantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PizzaOrderCubit, PizzaOrderState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0, 30, 20),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
              final isAddedToCart = cartCubit.cartPizzaItems
                  .where((element) => element.pizzaSize == pizzaModel.pizzaSize)
                  .any((element) => pizzaModel.id == element.id);
              return MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  if (isAddedToCart) {
                    BlocProvider.of<CartCubit>(context)
                        .deleteFromCartDatabase(pizzaModel);
                  } else {
                    BlocProvider.of<CartCubit>(context).insertIntoCartDatabase(
                        pizzaModel, pizzaQuantity, price);
                  }
                },
                color: MyColors.myNavyBlue,
                textColor: Colors.white,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isAddedToCart ? 'Remove From Cart' : 'Add To Cart',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      isAddedToCart
                          ? Icons.remove_shopping_cart_rounded
                          : Icons.add_shopping_cart_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
