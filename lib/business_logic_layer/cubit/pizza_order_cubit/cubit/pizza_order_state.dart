// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pizza_order_cubit.dart';

sealed class PizzaOrderState {}

final class PizzaOrderInitial extends PizzaOrderState {}

class OnIncrementPizzaOrder extends PizzaOrderState {}

class OnDecrementPizzaOrder extends PizzaOrderState {}

class OnPizzaPriceUpdated extends PizzaOrderState {}

class SmallPizzaSizeState extends PizzaOrderState {}

class MediumPizzaSizeState extends PizzaOrderState {}

class LargePizzaSizeState extends PizzaOrderState {}

class PizzaQuantityChanged extends PizzaOrderState {}
