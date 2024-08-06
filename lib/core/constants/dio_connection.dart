import 'package:dio/dio.dart';

class DioConnections {
  late Dio dio;
  final String baseUrl;
  DioConnections({required this.baseUrl}) {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 15),
    );
    dio = Dio(baseOptions);
  }
}
