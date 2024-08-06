import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic_layer/cart_cubit/cubit/cart_cubit.dart';
import '../../business_logic_layer/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import '../../data_layer/models/pizza_model.dart';

Widget buildAddAndRemoveContainer({
  required VoidCallback onPressed,
  required IconData icon,
}) {
  return Container(
    height: 35.h,
    width: 35.w,
    decoration: BoxDecoration(
        color: Colors.grey.shade100,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade400)),
    child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 20.sp,
        )),
  );
}

class PizzaQuantityDecrementalContainer extends StatelessWidget {
  final PizzaOrderCubit pizzaOrderCubit;
  final CartCubit cartCubit;
  final PizzaModel pizzaModel;
  const PizzaQuantityDecrementalContainer(
      {super.key,
      required this.pizzaOrderCubit,
      required this.cartCubit,
      required this.pizzaModel});

  @override
  Widget build(BuildContext context) {
    return buildAddAndRemoveContainer(
        onPressed: () {
          pizzaOrderCubit.decrementPizzaOrder(
              cartCubit.cartPizzaItems,
              pizzaOrderCubit.showPizzaQuantity(
                  pizzaModel, cartCubit.cartPizzaItems),
              pizzaModel);
          cartCubit.updateToCartDatabase(pizzaModel);
        },
        icon: Icons.remove);
  }
}

class PizzaQuantityIncrementalContainer extends StatelessWidget {
  final PizzaOrderCubit pizzaOrderCubit;
  final CartCubit cartCubit;
  final PizzaModel pizzaModel;
  const PizzaQuantityIncrementalContainer(
      {super.key,
      required this.pizzaOrderCubit,
      required this.cartCubit,
      required this.pizzaModel});

  @override
  Widget build(BuildContext context) {
    return buildAddAndRemoveContainer(
        onPressed: () {
          pizzaOrderCubit.incrementPizzaOrder(
              cartCubit.cartPizzaItems,
              pizzaOrderCubit.showPizzaQuantity(
                  pizzaModel, cartCubit.cartPizzaItems),
              pizzaModel);
          cartCubit.updateToCartDatabase(pizzaModel);
        },
        icon: Icons.add);
  }
}
