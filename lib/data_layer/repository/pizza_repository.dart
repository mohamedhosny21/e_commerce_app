import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/data_layer/webservices/pizza_webservices.dart';

class PizzaRepository {
  final PizzaWebServices pizzaWebServices;

  PizzaRepository(this.pizzaWebServices);
  Future<List<PizzaModel>> getPizzaRepo(String pizzaCategory) async {
    final allPizza = await pizzaWebServices.getPizzaWebservices(pizzaCategory);
    return allPizza.map((pizza) => PizzaModel.fromJson(pizza)).toList();
  }
}
