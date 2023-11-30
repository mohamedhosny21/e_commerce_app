part of 'favorite_pizza_cubit.dart';

sealed class FavoritePizzaState {}

final class FavoritePizzaInitial extends FavoritePizzaState {}

class OnSetFavoriteItemsState extends FavoritePizzaState {}

class CreateDatabaseState extends FavoritePizzaState {}

class OpenDatabaseState extends FavoritePizzaState {}

class GetDatabaseState extends FavoritePizzaState {}

class DeleteDatabaseState extends FavoritePizzaState {}

class InsertDatabaseState extends FavoritePizzaState {}
