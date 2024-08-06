import 'package:flutter/material.dart';

import '../models/pizza_model.dart';
import '../webservices/pizza_webservices.dart';

class PizzaRepository {
  final PizzaWebServices pizzaWebServices;
  String? errorStatusMsg;
  PizzaRepository(this.pizzaWebServices);
  Future<List<PizzaModel>> getPizzaRepo(
      {required String pizzaCategory, required String lang}) async {
    try {
      final allPizza =
          await pizzaWebServices.getPizzaWebservices(pizzaCategory, lang);
      debugPrint('all Pizza : $allPizza');
      return allPizza.map((pizza) => PizzaModel.fromJson(pizza)).toList();
    } catch (error) {
      errorStatusMsg = pizzaWebServices.errorStatusMsg;
      debugPrint('error : $error');
      throw Exception(error);
    }
  }
}
