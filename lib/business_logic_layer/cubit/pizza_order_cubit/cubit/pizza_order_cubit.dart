import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';

part 'pizza_order_state.dart';

class PizzaOrderCubit extends Cubit<PizzaOrderState> {
  PizzaOrderCubit() : super(PizzaOrderInitial());
  late int pizzaSizeIndex;
  num currentPrice = 0;
  late int pizzaQuantity;
  num originalPrice = 0;

//update pizza quantity in both pizza order screen and cart screen at the same time if one is updated (incremented or decremented)
  void changePizzaQuantity(
      PizzaModel pizzaModel, int pizzaQuantity, BuildContext context) {
    final List<PizzaModel> cartItems =
        BlocProvider.of<CartCubit>(context).cartPizzaItems;
    final int index =
        cartItems.indexWhere((element) => element.id == pizzaModel.id);

    if (index != -1) {
      cartItems[index].pizzaQuantity = pizzaQuantity;
      // pizzaModel.pizzaQuantity = pizzaQuantity;
    } else {
      pizzaModel.pizzaQuantity = pizzaQuantity;
    }
    updatePizzaPrice(pizzaSizeIndex, pizzaModel, context);
  }

  void incrementPizzaOrder(
      BuildContext context, int pizzaQuantity, PizzaModel pizzaModel) {
    pizzaQuantity++;
    this.pizzaQuantity = pizzaQuantity;
    changePizzaQuantity(pizzaModel, pizzaQuantity, context);
    BlocProvider.of<CartCubit>(context)
        .updateToCartDatabase(pizzaModel, currentPrice);

    emit(OnIncrementPizzaOrder());
  }

  void decrementPizzaOrder(
      BuildContext context, int pizzaQuantity, PizzaModel pizzaModel) {
    if (pizzaQuantity > 1) {
      pizzaQuantity--;
      this.pizzaQuantity = pizzaQuantity;

      changePizzaQuantity(pizzaModel, pizzaQuantity, context);
      BlocProvider.of<CartCubit>(context)
          .updateToCartDatabase(pizzaModel, currentPrice);
    }
    emit(OnDecrementPizzaOrder());
  }

  void updatePizzaPrice(
      int pizzaSizeIndex, PizzaModel pizzaModel, BuildContext context) {
    final List<PizzaModel> cartItems =
        BlocProvider.of<CartCubit>(context).cartPizzaItems;
    final int index =
        cartItems.indexWhere((element) => element.id == pizzaModel.id);
    if (index != -1) {
      pizzaQuantity = cartItems[index].pizzaQuantity!;
      pizzaModel.pizzaQuantity = cartItems[index].pizzaQuantity;

      //because i can't access orginal price in cart items so i save it in sql and get it

      originalPrice = cartItems[index].originalPrice!;
    } else {
      pizzaQuantity = pizzaModel.pizzaQuantity!;
      originalPrice = pizzaModel.price!;
    }

    this.pizzaSizeIndex = pizzaSizeIndex;
    if (pizzaSizeIndex == 1) {
      currentPrice = (originalPrice / 2) * pizzaQuantity;
      emit(SmallPizzaSizeState());
    } else if (pizzaSizeIndex == 2) {
      currentPrice = originalPrice * pizzaQuantity;
      emit(MediumPizzaSizeState());
    } else if (pizzaSizeIndex == 3) {
      currentPrice = originalPrice * 2 * pizzaQuantity;
      emit(LargePizzaSizeState());
    }

    emit(OnPizzaPriceUpdated());
  }
}
