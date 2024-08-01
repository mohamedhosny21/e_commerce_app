import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_slice/constants/dio_connection.dart';
import 'package:home_slice/constants/strings.dart';

class PizzaWebServices {
  String? errorStatusMsg;
  Future<List<dynamic>> getPizzaWebservices(
      String pizzaCategory, String lang) async {
    try {
      print('category : $pizzaCategory');
      Response response =
          await DioConnections(baseUrl: ApiConstants.pizzaBaseUrl).dio.get(
              ApiConstants.pizzaEndPoint,
              queryParameters: {'category': pizzaCategory, 'lang': lang});
      debugPrint('Status Code : ${response.statusCode}');
      List<dynamic> allPizza = response.data['allpizza'];
      return allPizza;
    } on DioException catch (error) {
      errorStatusMsg = error.response?.statusMessage;
      debugPrint('Status Code : ${error.response?.statusCode}');
      throw Exception(error.toString());
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
