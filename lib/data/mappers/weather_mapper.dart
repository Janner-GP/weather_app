
import 'package:weather_app/data/models/io_tomorrow/weather_forecast_response.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/domain/entities/weather.dart';

class WeatherMapper {
  static Weather todayResponsetoEntity(WeatherTodayResponse weatherData) {

    return Weather(
      cloudCover: weatherData.data.values.cloudCover,
      humidity: weatherData.data.values.humidity,
      dewPoint: weatherData.data.values.dewPoint,
      temperature: weatherData.data.values.temperature,
      visibility: weatherData.data.values.visibility,
      weatherCode: weatherData.data.values.weatherCode,
      windDirection: weatherData.data.values.windDirection,
      windSpeed: weatherData.data.values.windSpeed,
      pressureSurfaceLevel: weatherData.data.values.pressureSurfaceLevel,
      rainIntensity: weatherData.data.values.rainIntensity,
      sleetIntensity: weatherData.data.values.sleetIntensity,
      snowIntensity: weatherData.data.values.snowIntensity,
      temperatureApparent: weatherData.data.values.temperatureApparent,
      uvHealthConcern: weatherData.data.values.uvHealthConcern,
      uvIndex: weatherData.data.values.uvIndex,
      windGust: weatherData.data.values.windGust,
      precipitationProbability: weatherData.data.values.precipitationProbability,
      freezingRainIntensity: weatherData.data.values.freezingRainIntensity,
      cloudBase: weatherData.data.values.cloudBase ?? 0.0,
      cloudCeiling: weatherData.data.values.cloudCeiling ?? 0.0,
    );
  }

  static Weather forecastResponsetoEntity(WeatherForecastResponse weatherForecast, Data timeLine) {

    return Weather(
      cloudCover: timeLine.values.cloudCover,
      humidity: timeLine.values.humidity,
      dewPoint: timeLine.values.dewPoint,
      temperature: timeLine.values.temperature,
      visibility: timeLine.values.visibility,
      weatherCode: timeLine.values.weatherCode,
      windDirection: timeLine.values.windDirection,
      windSpeed: timeLine.values.windSpeed,
      pressureSurfaceLevel: timeLine.values.pressureSurfaceLevel,
      rainIntensity: timeLine.values.rainIntensity,
      sleetIntensity: timeLine.values.sleetIntensity,
      snowIntensity: timeLine.values.snowIntensity,
      temperatureApparent: timeLine.values.temperatureApparent,
      uvHealthConcern: timeLine.values.uvHealthConcern,
      uvIndex: timeLine.values.uvIndex,
      windGust: timeLine.values.windGust,
      precipitationProbability: timeLine.values.precipitationProbability,
      freezingRainIntensity: timeLine.values.freezingRainIntensity,
      cloudBase: timeLine.values.cloudBase ?? 0.0,
      cloudCeiling: timeLine.values.cloudCeiling ?? 0.0,
    );
  }
}