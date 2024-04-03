import 'package:dio/dio.dart';
import 'package:weather_app/config/config.dart';
import 'package:weather_app/data/errors/weather_error.dart';
import 'package:weather_app/data/mappers/weather_mapper.dart';
import 'package:weather_app/data/models/io_tomorrow/weather_forecast_response.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/domain/datasources/weather_datasource.dart';
import 'package:weather_app/domain/entities/weather.dart';

class WeatherDataSourceImpl implements WeatherDataSource {

  List<Weather> _jsonToWeatherList(Map<String, dynamic> json, String? timeFrame) {
    final List<Data> timeLine;
    final weatherResponse = WeatherForecastResponse.fromJson(json);

    if (timeFrame == 'hourly') {
      timeLine = weatherResponse.timeline.hourly;
    } else if (timeFrame == 'daily') {
      timeLine = weatherResponse.timeline.daily;
    } else if (timeFrame == 'minutely') {
      timeLine = weatherResponse.timeline.minutely;
    } else {
      throw Exception('Invalid time frame');
    }
    final List<Weather> weatherList = timeLine.map((e) => WeatherMapper.forecastResponsetoEntity(weatherResponse, e)).toList();
    return weatherList;

  }

  @override
  Future<Weather> getWeather(String? city, double? latitude, double? longitude) async {
    try {
      String specificPath = '/realtime';
      String queryParams = 'location=$latitude,$longitude';
      final response = await DioService().createDio().get(
        '$specificPath?$queryParams',
      );

      final data = WeatherTodayResponse.fromJson(response.data);
      final weather = WeatherMapper.todayResponsetoEntity(data);
      return weather;
    } on DioException catch (e) {
        if(e.response?.statusCode == 401) throw CustomError(message: e.response?.data['message'], errorCode: e.response?.statusCode);
        throw Exception();
    } catch (e) {
        throw CustomError(message: e.toString());
    }
  }

  @override
  Future<List<Weather>> getWeatherForecast(String? city, double? latitude, double? longitude) async {
    try {
      String specificPath = '/forecast';
      String queryParams = 'location=$latitude,$longitude';
      final response = await DioService().createDio().get(
        '$specificPath?$queryParams',
      );

      final weather = _jsonToWeatherList(response.data, 'hourly');
      return weather;
    } on DioException catch (e) {
        if(e.response?.statusCode == 401) throw CustomError(message: e.response?.data['message'], errorCode: e.response?.statusCode);
        throw Exception();
    } catch (e) {
        throw CustomError(message: e.toString());
    }
  }
}