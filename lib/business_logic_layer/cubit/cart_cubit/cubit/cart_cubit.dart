import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:sqflite/sqflite.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<PizzaModel> cartPizzaItems = [];
  num totalPrice = 0;
  num subTotalPrice = 0;
  String pizzaSize = '';
  late Database database;

  Future<void> createAndOpenCartDatabase() async {
    openDatabase(
      'caaaaa.db',
      version: 1,
      onCreate: (db, version) {
        debugPrint('cart Database is created');

        db
            .execute(
                'CREATE TABLE Cart(ID INTEGER ,PizzaImage TEXT,PizzaName TEXT,OriginalPrice INTEGER,Price INTEGER,MenuDescription TEXT,PizzaQuantity INTEGER,PizzaSize TEXT,PizzaSizeIndex INTEGER)')
            .then((value) {
          debugPrint('cart Table is created');
        });
      },
      onOpen: (db) {
        emit(OpenDatabaseState());
        debugPrint('cart Database is opened');
        getFromCartDatabase(db);
      },
    ).then((value) {
      database = value;
      emit(CreateDatabaseState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> insertIntoCartDatabase(
      PizzaModel pizzaModel, int pizzaQuantity, num price) async {
    database
        .transaction((txn) => txn.rawInsert(
            'INSERT INTO Cart(ID,PizzaImage,PizzaName,OriginalPrice,Price,MenuDescription,PizzaQuantity,PizzaSize,PizzaSizeIndex) VALUES(${pizzaModel.id}, "${pizzaModel.image}", "${pizzaModel.pizzaName}",${pizzaModel.price},$price,"${pizzaModel.menuDescription}",$pizzaQuantity,"${pizzaModel.pizzaSize}",${pizzaModel.pizzaSizeIndex})'))
        .then((value) {
      debugPrint(
          '${pizzaModel.pizzaName} is inserted successfully to cart database');
      emit(InsertDatabaseState());
      getFromCartDatabase(database);
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> deleteFromCartDatabase(PizzaModel pizzaModel) async {
    database.rawDelete('DELETE FROM Cart WHERE PizzaSize=?',
        ['${pizzaModel.pizzaSize}']).then((value) {
      debugPrint(
          '${pizzaModel.pizzaName} is deleted successfully from cart database');
      emit(DeleteDatabaseState());

      getFromCartDatabase(database);
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getFromCartDatabase(Database database) async {
    database.rawQuery('SELECT * FROM Cart').then((value) {
      debugPrint(value.toString());
      emit(GetDatabaseState());
      cartPizzaItems = value.map((row) {
        return PizzaModel(
            //give me the value of element that exist in ID column or PizzaName column or Price column
            //OR
            //give me the value whose key is ID or PizzaName or Price of the element
            id: row['ID'] as int,
            pizzaName: row['PizzaName'] as String,
            image: row['PizzaImage'] as String,
            originalPrice: row['OriginalPrice'] as num,
            price: row['Price'] as num,
            menuDescription: row['MenuDescription'] as String,
            pizzaQuantity: row['PizzaQuantity'] as int,
            pizzaSize: row['PizzaSize'] as String,
            pizzaSizeIndex: row['PizzaSizeIndex'] as int);
      }).toList();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> updateToCartDatabase(PizzaModel pizzaModel, num price) async {
    final isAddedToCart = cartPizzaItems
        .where((element) => element.pizzaSize == pizzaModel.pizzaSize)
        .any((element) => element.id == pizzaModel.id);
    if (isAddedToCart) {
      database.rawUpdate(
          "UPDATE Cart SET PizzaQuantity=?  , Price=? WHERE ID=?",
          [pizzaModel.pizzaQuantity, price, pizzaModel.id]).then((value) {
        emit(UpdateToDatabaseState());

        debugPrint('${pizzaModel.pizzaName} is updated successfully');
        debugPrint(
            'pizza quantity : ${pizzaModel.pizzaQuantity} pizza size index : ${pizzaModel.pizzaSizeIndex} , pizza size : ${pizzaModel.pizzaSize}');
        getFromCartDatabase(database);
      }).catchError((error) {
        debugPrint(error.toString());
      });
    }
  }

  void getPaymentPrice() {
    subTotalPrice = 0;
    for (int index = 0; index < cartPizzaItems.length; index++) {
      subTotalPrice = subTotalPrice + cartPizzaItems[index].price!;
    }
    totalPrice = subTotalPrice + 10;
  }
}
