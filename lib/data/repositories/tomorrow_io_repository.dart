import 'package:weather_app/data/datasources/weather_datasource_impl.dart';
import 'package:weather_app/domain/datasources/weather_datasource.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class TomorrowIoRepository extends WeatherRepository {

  final WeatherDataSource weatherDataSource;

  TomorrowIoRepository({WeatherDataSource? weatherDataSource}) : weatherDataSource = weatherDataSource ?? WeatherDataSourceImpl();

  @override
  Future<Weather> getWeather(String? city, double? latitude, double? longitude) {
    return weatherDataSource.getWeather(city, latitude, longitude);
  }

  @override
  Future<List<Weather>> getWeatherForecast(String? city, double? latitude, double? longitude) {
    return weatherDataSource.getWeatherForecast(city, latitude, longitude);
  }
}