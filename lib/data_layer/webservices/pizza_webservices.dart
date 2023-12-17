import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_slice/constants/dio_connection.dart';
import 'package:home_slice/constants/strings.dart';

class PizzaWebServices {
  String? errorStatusMsg;
  Future<List<dynamic>> getPizzaWebservices(String pizzaCategory) async {
    try {
      Response response = await DioConnections()
          .dio
          .get(pizzaEndPoint, queryParameters: {'category': pizzaCategory});
      debugPrint('Status Code : ${response.statusCode}');

      return response.data;
    } on DioException catch (error) {
      errorStatusMsg = error.response?.statusMessage;
      debugPrint('Status Code : ${error.response?.statusCode}');
      return throw Exception(error.toString());
    } catch (error) {
      return throw Exception(error.toString());
    }
  }
}
