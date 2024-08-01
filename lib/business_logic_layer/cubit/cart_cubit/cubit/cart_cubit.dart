import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/helpers/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

// import 'package:path/path.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial()) {
    createAndOpenCartDatabase();
    // deleteAllRecords();
  }
  List<PizzaModel> cartPizzaItems = [];
  num totalPrice = 0;
  num subTotalPrice = 0;
  num deliveryFee = 0;
  String pizzaSize = '';
  late Database database;

  Future<void> createAndOpenCartDatabase() async {
    openDatabase(
      'cart.db',
      version: 1,
      onCreate: (db, version) {
        debugPrint('cart Database is created');

        db
            .execute(
                'CREATE TABLE Cart(ID INTEGER,UserID TEXT ,PizzaImage TEXT,PizzaName TEXT,OriginalPrice INTEGER,SmallPizzaPrice INTEGER,MediumPizzaPrice INTEGER,LargePizzaPrice INTEGER,MenuDescription TEXT,SmallPizzaQuantity INTEGER,MediumPizzaQuantity INTEGER,LargePizzaQuantity INTEGER,PizzaSize TEXT,PizzaSizeIndex INTEGER)')
            .then((value) {
          debugPrint('cart Table is created');
        });
      },
      onOpen: (db) {
        emit(OpenDatabaseState());
        debugPrint('cart Database is opened');
      },
    ).then((value) {
      database = value;
      getFromCartDatabase(database);
      emit(CreateDatabaseState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> insertIntoCartDatabase(PizzaModel pizzaModel) async {
    final savedUserId =
        await SharedPreferencesHelpers.getUserIdWithSharedPrefs();
    database
        .transaction((txn) => txn.rawInsert(
            'INSERT INTO Cart(ID,UserID,PizzaImage,PizzaName,OriginalPrice,SmallPizzaPrice,MediumPizzaPrice,LargePizzaPrice,MenuDescription,SmallPizzaQuantity,MediumPizzaQuantity,LargePizzaQuantity,PizzaSize,PizzaSizeIndex) VALUES(${pizzaModel.id},"$savedUserId", "${pizzaModel.image}", "${pizzaModel.pizzaName}",${pizzaModel.originalPrice},${pizzaModel.price?.smallPizzaPrice},${pizzaModel.price?.mediumPizzaPrice},${pizzaModel.price?.largePizzaPrice},"${pizzaModel.menuDescription}",${pizzaModel.pizzaQuantity?.smallPizzaQuantity},${pizzaModel.pizzaQuantity?.mediumPizzaQuantity},${pizzaModel.pizzaQuantity?.largePizzaQuantity},"${pizzaModel.pizzaSize}",${pizzaModel.pizzaSizeIndex})'))
        .then((value) {
      debugPrint(
          '${pizzaModel.pizzaName} is inserted successfully to cart database');
      debugPrint(
          '${pizzaModel.pizzaQuantity?.smallPizzaQuantity} is inserted successfully to cart database');
      emit(InsertDatabaseState());
      getFromCartDatabase(database);
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> deleteFromCartDatabase(PizzaModel pizzaModel) async {
    final savedUserId =
        await SharedPreferencesHelpers.getUserIdWithSharedPrefs();

    database.rawDelete(
        'DELETE FROM Cart WHERE ID=? AND PizzaSizeIndex=? AND UserID=?  ',
        [pizzaModel.id, pizzaModel.pizzaSizeIndex, savedUserId]).then((value) {
      debugPrint(
          '${pizzaModel.pizzaName} is deleted successfully from cart database');
      debugPrint('size index of deleted item ${pizzaModel.pizzaSizeIndex} ');
      emit(DeleteDatabaseState());

      getFromCartDatabase(database);
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getFromCartDatabase(Database database) async {
    final savedUserId =
        await SharedPreferencesHelpers.getUserIdWithSharedPrefs();
    database.rawQuery('SELECT * FROM Cart WHERE UserID=?', [savedUserId]).then(
        (value) {
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
            price: PizzaPrice(
                smallPizzaPrice: row['SmallPizzaPrice'] as num,
                mediumPizzaPrice: row['MediumPizzaPrice'] as num,
                largePizzaPrice: row['LargePizzaPrice'] as num),
            menuDescription: row['MenuDescription'] as String,
            pizzaQuantity: PizzaQuantity(
                smallPizzaQuantity: row['SmallPizzaQuantity'] as int,
                mediumPizzaQuantity: row['MediumPizzaQuantity'] as int,
                largePizzaQuantity: row['LargePizzaQuantity'] as int),
            pizzaSize: row['PizzaSize'] as String,
            pizzaSizeIndex: row['PizzaSizeIndex'] as int);
      }).toList();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> updateToCartDatabase(PizzaModel pizzaModel) async {
    final savedUserId =
        await SharedPreferencesHelpers.getUserIdWithSharedPrefs();

    final isAddedToCart = cartPizzaItems
        .where((element) => element.pizzaSize == pizzaModel.pizzaSize)
        .any((element) => element.id == pizzaModel.id);
    if (isAddedToCart) {
      database.rawUpdate(
          'UPDATE Cart SET SmallPizzaQuantity=?,MediumPizzaQuantity=?,LargePizzaQuantity=?,SmallPizzaPrice=?,MediumPizzaPrice=?,LargePizzaPrice=? WHERE ID=? AND UserID=?',
          [
            pizzaModel.pizzaQuantity?.smallPizzaQuantity,
            pizzaModel.pizzaQuantity?.mediumPizzaQuantity,
            pizzaModel.pizzaQuantity?.largePizzaQuantity,
            pizzaModel.price?.smallPizzaPrice,
            pizzaModel.price?.mediumPizzaPrice,
            pizzaModel.price?.largePizzaPrice,
            pizzaModel.id,
            savedUserId
          ]).then((value) {
        emit(UpdateToDatabaseState());

        debugPrint('${pizzaModel.pizzaName} is updated successfully');
        debugPrint(
            'small pizza quantity : ${pizzaModel.pizzaQuantity?.smallPizzaQuantity} , Price:${pizzaModel.price?.smallPizzaPrice}');
        debugPrint(
            'medium pizza quantity : ${pizzaModel.pizzaQuantity?.mediumPizzaQuantity} , Price:${pizzaModel.price?.mediumPizzaPrice}');
        debugPrint(
            'large pizza quantity : ${pizzaModel.pizzaQuantity?.largePizzaQuantity}  , Price:${pizzaModel.price?.largePizzaPrice}');
        getFromCartDatabase(database);
      }).catchError((error) {
        debugPrint(error.toString());
      });
    }
  }

  void getPaymentPrice() {
    subTotalPrice = 0;
    deliveryFee = 0;
    num cartItemsPrice = 0;
    for (int index = 0; index < cartPizzaItems.length; index++) {
      if (cartPizzaItems[index].pizzaSizeIndex == 1) {
        cartItemsPrice = cartPizzaItems[index].price!.smallPizzaPrice;
      } else if (cartPizzaItems[index].pizzaSizeIndex == 2) {
        cartItemsPrice = cartPizzaItems[index].price!.mediumPizzaPrice;
      } else if (cartPizzaItems[index].pizzaSizeIndex == 3) {
        cartItemsPrice = cartPizzaItems[index].price!.largePizzaPrice;
      }
      // print(cartItemsPrice);
      subTotalPrice = subTotalPrice + cartItemsPrice;
    }
    if (cartPizzaItems.isNotEmpty) {
      deliveryFee = 10;
    }
    totalPrice = subTotalPrice + deliveryFee;
    emit(PaymentPriceChanged());
  }

  // Future<void> deleteAllRecords() async {
  //   // Open the database
  //   final databasePath = await getDatabasesPath();
  //   final database = await openDatabase(
  //     join(databasePath, 'my_cartt.db'),
  //     version: 1,
  //   );

  //   // Specify the table name
  //   const tableName = 'Cart';

  //   // Delete all records in the table
  //   await database.delete(tableName).then((value) {
  //     print('deleted');
  //   }).catchError((onError) {
  //     print('Error: ${onError.toString()}');
  //   });

  //   // Close the database
  //   await database.close();
  // }
}
