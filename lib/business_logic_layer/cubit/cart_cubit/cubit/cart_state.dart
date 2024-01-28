part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {
  CartInitial();
}

class CreateDatabaseState extends CartState {}

class OpenDatabaseState extends CartState {}

class GetDatabaseState extends CartState {}

class DeleteDatabaseState extends CartState {}

class InsertDatabaseState extends CartState {}

class UpdateToDatabaseState extends CartState {}

class PaymentPriceChanged extends CartState {}

class CloseDatabaseState extends CartState {}
