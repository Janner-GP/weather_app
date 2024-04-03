class Weather {
  final double? cloudBase;
  final double? cloudCeiling;
  final num? cloudCover;
  final num? dewPoint;
  final num? freezingRainIntensity;
  final num? humidity;
  final num? precipitationProbability;
  final num? pressureSurfaceLevel;
  final num? rainIntensity;
  final num? sleetIntensity;
  final num? snowIntensity;
  final num? temperature;
  final num? temperatureApparent;
  final num? uvHealthConcern;
  final num? uvIndex;
  final num? visibility;
  final int weatherCode;
  final num? windDirection;
  final num? windGust;
  final num? windSpeed;

  Weather({
    this.cloudBase,
    this.cloudCeiling,
    this.cloudCover,
    this.dewPoint,
    this.freezingRainIntensity,
    this.humidity,
    this.precipitationProbability,
    this.pressureSurfaceLevel,
    this.rainIntensity,
    this.sleetIntensity,
    this.snowIntensity,
    this.temperature,
    this.temperatureApparent,
    this.uvHealthConcern,
    this.uvIndex,
    this.visibility,
    required this.weatherCode,
    this.windDirection,
    this.windGust,
    this.windSpeed,
  });
}