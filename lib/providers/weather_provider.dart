import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/data/errors/weather_error.dart';
import 'package:weather_app/data/repositories/tomorrow_io_repository.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import '../domain/entities/weather.dart';

// Provider
final weatherProvider =
    StateNotifierProvider<WeatherNotifier, WeatherState>((ref) {
  //! Repositorio de clima - Modificar por el repositorio que se desee utilizar
  final weatherRepository = TomorrowIoRepository();

  return WeatherNotifier(weatherRepository: weatherRepository);
});

// Notifier
class WeatherNotifier extends StateNotifier<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherNotifier({required this.weatherRepository}) : super(WeatherState());

  void getWeather(String? city, double? latitude, double? longitude) async {
    try {
      final weather = await weatherRepository.getWeather(city, latitude, longitude);
      state = state.copyWith(weather: weather);
    } on CustomError catch (e) {
      _errorHandled(e.message);
    } catch (e) {
      _errorHandled(e.toString());
    }
  }

  void getWeatherForecast(String? city, double? latitude, double? longitude) async {
    if (state.isForecastFetch) return;

    try {
      final weatherForecast = await weatherRepository.getWeatherForecast(city, latitude, longitude);
      state = state.copyWith(forecast: weatherForecast, isForecastFetch: true);
    } on CustomError catch (e) {
      _errorHandled(e.message);
    } catch (e) {
      _errorHandled(e.toString());
    }
  }

  void _errorHandled(errorMessage) {
    state = state.copyWith(errorMessage: errorMessage);
  }
}

// Estado del notifier
class WeatherState {
  final Weather? weather;
  final List<Weather>? forecast;
  final String errorMessage;
  final bool isForecastFetch;

  WeatherState(
      {this.weather,
      this.errorMessage = '',
      this.isForecastFetch = false,
      this.forecast});

  WeatherState copyWith(
      {Weather? weather,
      String? errorMessage,
      bool? isForecastFetch,
      List<Weather>? forecast}) {
    return WeatherState(
      weather: weather ?? this.weather,
      errorMessage: errorMessage ?? this.errorMessage,
      isForecastFetch: isForecastFetch ?? this.isForecastFetch,
      forecast: forecast ?? this.forecast,
    );
  }
}
