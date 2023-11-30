import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:sqflite/sqflite.dart';
part 'favorite_pizza_state.dart';

class FavoritePizzaCubit extends Cubit<FavoritePizzaState> {
  FavoritePizzaCubit() : super(FavoritePizzaInitial());

  List<PizzaModel> favoriteItems = [];
  late Database database;
  late bool isFavorite = false;

  Future<void> createAndOpenFavoriteDatabase() async {
    openDatabase(
      'favourites.db',
      version: 1,
      onCreate: (db, version) {
        debugPrint('favorite Database is created');

        db
            .execute(
                'CREATE TABLE Favorites(ID INTEGER PRIMARY KEY,PizzaName TEXT,PizzaImage TEXT,Price INTEGER,MenuDescription TEXT)')
            .then((value) {
          debugPrint('favorite Table is created');
        });
      },
      onOpen: (db) {
        emit(OpenDatabaseState());
        debugPrint('Favorite Database is opened');
        getFromFavoriteDatabase(db);
      },
    ).then((value) {
      database = value;

      emit(CreateDatabaseState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> insertIntoFavoriteDatabase(PizzaModel pizzaModel) async {
    database
        .rawInsert(
            'INSERT INTO Favorites(ID, PizzaName, PizzaImage,Price,MenuDescription) VALUES(${pizzaModel.id}, "${pizzaModel.pizzaName}", "${pizzaModel.image}",${pizzaModel.price},"${pizzaModel.menuDescription}")')
        .then((value) {
      debugPrint(
          '${pizzaModel.pizzaName} is inserted successfully to favorite database');

      emit(InsertDatabaseState());
      getFromFavoriteDatabase(database);
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> deleteFromFavoriteDatabase(int id, PizzaModel pizzaModel) async {
    database.rawDelete('DELETE FROM Favorites WHERE ID=?', [id]).then((value) {
      debugPrint(
          '${pizzaModel.pizzaName} is deleted successfully from favorite database');

      emit(DeleteDatabaseState());
      getFromFavoriteDatabase(database);
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getFromFavoriteDatabase(Database database) async {
    database.rawQuery('SELECT * FROM Favorites').then((value) {
      debugPrint('$value');
      emit(GetDatabaseState());
      favoriteItems = value.map((row) {
        return PizzaModel(
            id: row['ID'] as int,
            pizzaName: row['PizzaName'] as String,
            image: row['PizzaImage'] as String,
            price: row['Price'] as num,
            menuDescription: row['MenuDescription'] as String);
      }).toList();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}
