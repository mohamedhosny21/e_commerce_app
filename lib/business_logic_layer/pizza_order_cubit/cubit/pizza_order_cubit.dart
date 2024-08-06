import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data_layer/models/pizza_model.dart';

part 'pizza_order_state.dart';

class PizzaOrderCubit extends Cubit<PizzaOrderState> {
  PizzaOrderCubit() : super(PizzaOrderInitial());
  late int pizzaQuantity;
  num originalPrice = 0;

//update pizza quantity in both pizza order screen and cart screen at the same time if one is updated (incremented or decremented)
  void changePizzaQuantity(
      PizzaModel pizzaModel, int pizzaQuantity, List<PizzaModel> cartItems) {
    final int index = cartItems.indexWhere((element) =>
        element.id == pizzaModel.id &&
        element.pizzaSizeIndex == pizzaModel.pizzaSizeIndex);

    if (index != -1) {
      if (pizzaModel.pizzaSizeIndex == 1) {
        cartItems[index].pizzaQuantity?.smallPizzaQuantity = pizzaQuantity;
      } else if (pizzaModel.pizzaSizeIndex == 2) {
        cartItems[index].pizzaQuantity?.mediumPizzaQuantity = pizzaQuantity;
      } else if (pizzaModel.pizzaSizeIndex == 3) {
        cartItems[index].pizzaQuantity?.largePizzaQuantity = pizzaQuantity;
      }
    } else {
      if (pizzaModel.pizzaSizeIndex == 1) {
        pizzaModel.pizzaQuantity?.smallPizzaQuantity = pizzaQuantity;
      } else if (pizzaModel.pizzaSizeIndex == 2) {
        pizzaModel.pizzaQuantity?.mediumPizzaQuantity = pizzaQuantity;
      } else if (pizzaModel.pizzaSizeIndex == 3) {
        pizzaModel.pizzaQuantity?.largePizzaQuantity = pizzaQuantity;
      }
    }

    updatePizzaPrice(pizzaModel, cartItems);

    emit(PizzaQuantityChanged());
  }

  void incrementPizzaOrder(
      List<PizzaModel> cartItems, int pizzaQuantity, PizzaModel pizzaModel) {
    pizzaQuantity++;
    changePizzaQuantity(pizzaModel, pizzaQuantity, cartItems);

    emit(OnIncrementPizzaOrder());
  }

  void decrementPizzaOrder(
      List<PizzaModel> cartItems, int pizzaQuantity, PizzaModel pizzaModel) {
    if (pizzaQuantity > 1) {
      pizzaQuantity--;

      changePizzaQuantity(pizzaModel, pizzaQuantity, cartItems);
    }
    emit(OnDecrementPizzaOrder());
  }

//get quantity from cart or from pizza model according to the passed model through constructor or parameter
  int getPizzaQuantity(
    PizzaModel pizzaModel,
    int pizzaSizeIndex,
  ) {
    switch (pizzaSizeIndex) {
      case 1:
        return pizzaModel.pizzaQuantity!.smallPizzaQuantity;
      case 2:
        return pizzaModel.pizzaQuantity!.mediumPizzaQuantity;
      case 3:
        return pizzaModel.pizzaQuantity!.largePizzaQuantity;
      default:
        return 0;
    }
  }

  num getPizzaSizeFactor(int pizzaSizeIndex) {
    return pizzaSizeIndex == 1 ? 0.5 : (pizzaSizeIndex == 2 ? 1 : 2);
  }

  int showPizzaQuantity(PizzaModel pizzaModel, List<PizzaModel> cartItems) {
    final int index = cartItems.indexWhere((element) =>
        element.id == pizzaModel.id &&
        element.pizzaSizeIndex == pizzaModel.pizzaSizeIndex);
    if (index != -1) {
      return getPizzaQuantity(cartItems[index], pizzaModel.pizzaSizeIndex!);
    } else {
      return getPizzaQuantity(pizzaModel, pizzaModel.pizzaSizeIndex!);
    }
  }

  num getoriginalPrice(PizzaModel pizzaModel) {
    return pizzaModel.originalPrice *
        getPizzaSizeFactor(pizzaModel.pizzaSizeIndex!);
  }

  void updatePizzaPrice(PizzaModel pizzaModel, List<PizzaModel> cartItems) {
    final int index = cartItems.indexWhere((element) =>
        element.id == pizzaModel.id &&
        element.pizzaSizeIndex == pizzaModel.pizzaSizeIndex);
    if (index != -1) {
      pizzaQuantity =
          getPizzaQuantity(cartItems[index], pizzaModel.pizzaSizeIndex!);
      pizzaModel.pizzaQuantity?.smallPizzaQuantity =
          cartItems[index].pizzaQuantity!.smallPizzaQuantity;

      pizzaModel.pizzaQuantity?.mediumPizzaQuantity =
          cartItems[index].pizzaQuantity!.mediumPizzaQuantity;

      pizzaModel.pizzaQuantity?.largePizzaQuantity =
          cartItems[index].pizzaQuantity!.largePizzaQuantity;

      originalPrice = getoriginalPrice(cartItems[index]);

      updatePizzaPriceBasedOnSize(
          pizzaModel, pizzaModel.pizzaSizeIndex!, pizzaQuantity, originalPrice);
    } else {
      pizzaQuantity = getPizzaQuantity(pizzaModel, pizzaModel.pizzaSizeIndex!);

      originalPrice = getoriginalPrice(pizzaModel);
      updatePizzaPriceBasedOnSize(
          pizzaModel, pizzaModel.pizzaSizeIndex!, pizzaQuantity, originalPrice);
    }

    emit(OnPizzaPriceUpdated());
  }

  void updatePizzaPriceBasedOnSize(PizzaModel pizzaModel, int pizzaSizeIndex,
      int pizzaQuantity, num originalPrice) {
    switch (pizzaSizeIndex) {
      case 1:
        pizzaModel.price?.smallPizzaPrice = pizzaQuantity * originalPrice;

      case 2:
        pizzaModel.price?.mediumPizzaPrice = pizzaQuantity * originalPrice;
      case 3:
        pizzaModel.price?.largePizzaPrice = pizzaQuantity * originalPrice;
    }
  }

  num showPizzaPrice(PizzaModel pizzaModel, List<PizzaModel> cartItems) {
    updatePizzaPrice(pizzaModel, cartItems);

    switch (pizzaModel.pizzaSizeIndex) {
      case 1:
        return pizzaModel.price!.smallPizzaPrice;
      case 2:
        return pizzaModel.price!.mediumPizzaPrice;
      case 3:
        return pizzaModel.price!.largePizzaPrice;
      default:
        return 0;
    }
  }
}
