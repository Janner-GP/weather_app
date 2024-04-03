import 'package:weather_app/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather(String? city, double? latitude, double? longitude);
  Future<List<Weather>> getWeatherForecast(String? city, double? latitude, double? longitude);
}