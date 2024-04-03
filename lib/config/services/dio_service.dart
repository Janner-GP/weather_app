import 'package:dio/dio.dart';
import 'package:weather_app/config/constants/enviroments.dart';

class DioService {

  Dio createDio() {
    Dio dio = Dio();

    dio.options.baseUrl = Environment.apiUrl;
    dio.options.queryParameters = {
      'apikey': Environment.apiKey,
    };
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    return dio;
  }
}