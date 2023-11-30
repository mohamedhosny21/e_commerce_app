import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_slice/constants/strings.dart';

class PizzaWebServices {
  late Dio dio;
  PizzaWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 15),
    );
    dio = Dio(baseOptions);
  }
  Future<List<dynamic>> getPizzaWebservices(String pizzaCategory) async {
    try {
      Response response = await dio
          .get('/allpizza', queryParameters: {'category': pizzaCategory});
      debugPrint(response.data.toString());
      return response.data;
    } catch (error) {
      debugPrint(error.toString());
      return [];
    }
  }
}
