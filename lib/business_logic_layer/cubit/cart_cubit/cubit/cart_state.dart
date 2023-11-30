part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {
  CartInitial();
}

class OnAddToCartState extends CartState {
  final String addSuccessMsg;

  OnAddToCartState({required this.addSuccessMsg});
}

class OnRemoveFromCartState extends CartState {
  final String removeSuccessMsg;

  OnRemoveFromCartState({required this.removeSuccessMsg});
}

class CreateDatabaseState extends CartState {}

class OpenDatabaseState extends CartState {}

class GetDatabaseState extends CartState {}

class DeleteDatabaseState extends CartState {}

class InsertDatabaseState extends CartState {}

class UpdateToDatabaseState extends CartState {}
