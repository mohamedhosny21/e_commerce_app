import 'package:dio/dio.dart';
import 'package:home_slice/constants/strings.dart';

class DioConnections {
  late Dio dio;
  DioConnections() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: pizzaBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 15),
    );
    dio = Dio(baseOptions);
  }
}
