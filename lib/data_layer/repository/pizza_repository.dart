import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/data_layer/webservices/pizza_webservices.dart';

import '../../helpers/shared_preferences.dart';

class PizzaRepository {
  final PizzaWebServices pizzaWebServices;
  String? errorStatusMsg;
  PizzaRepository(this.pizzaWebServices);
  Future<List<PizzaModel>> getPizzaRepo(String pizzaCategory) async {
    try {
      final String lang =
          await SharedPreferencesHelpers.getAppLanguage() ?? 'en';
      final allPizza =
          await pizzaWebServices.getPizzaWebservices(pizzaCategory, lang);
      print('aaaaaaaaa : $allPizza');
      return allPizza.map((pizza) => PizzaModel.fromJson(pizza)).toList();
    } catch (error) {
      errorStatusMsg = pizzaWebServices.errorStatusMsg;
      print('error : $error');
      throw Exception(error);
    }
  }
}
