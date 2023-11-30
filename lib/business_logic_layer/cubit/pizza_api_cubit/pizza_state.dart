part of 'pizza_cubit.dart';

sealed class PizzaState {}

final class PizzaInitial extends PizzaState {}

class LoadingState extends PizzaState {}

class PizzaLoadedState extends PizzaState {
  final List<PizzaModel> allPizza;

  PizzaLoadedState({required this.allPizza});
}

class PizzaErrorState extends PizzaState {
  final String errorMsg;

  PizzaErrorState({required this.errorMsg});
}
