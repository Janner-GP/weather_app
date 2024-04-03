class Data {
  final DateTime time;
  final WeatherData values;

  Data({required this.time, required this.values});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      time: DateTime.parse(json['time']),
      values: WeatherData.fromJson(json['values'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time.toIso8601String(),
      'values': values.toJson()
    };
  }
}

class Location {
  final double? latitude;
  final double? longitude;
  final String? city;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['lat'],
      longitude: json['lon'],
      city: json['city']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'city': city
    };
  }

  Location({required this.latitude, required this.longitude, required this.city});
}

class WeatherData {
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

  WeatherData({
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

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      cloudBase: json['cloudBase']?.toDouble(),
      cloudCeiling: json['cloudCeiling']?.toDouble(),
      cloudCover: json['cloudCover'],
      dewPoint: json['dewPoint'].toDouble(),
      freezingRainIntensity: json['freezingRainIntensity'].toDouble(),
      humidity: json['humidity'],
      precipitationProbability: json['precipitationProbability'],
      pressureSurfaceLevel: json['pressureSurfaceLevel'].toDouble(),
      rainIntensity: json['rainIntensity'].toDouble(),
      sleetIntensity: json['sleetIntensity'].toDouble(),
      snowIntensity: json['snowIntensity'].toDouble(),
      temperature: json['temperature'].toDouble(),
      temperatureApparent: json['temperatureApparent'].toDouble(),
      uvHealthConcern: json['uvHealthConcern'],
      uvIndex: json['uvIndex'],
      visibility: json['visibility'].toDouble(),
      weatherCode: json['weatherCode'],
      windDirection: json['windDirection'].toDouble(),
      windGust: json['windGust'].toDouble(),
      windSpeed: json['windSpeed'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cloudBase': cloudBase,
      'cloudCeiling': cloudCeiling,
      'cloudCover': cloudCover,
      'dewPoint': dewPoint,
      'freezingRainIntensity': freezingRainIntensity,
      'humidity': humidity,
      'precipitationProbability': precipitationProbability,
      'pressureSurfaceLevel': pressureSurfaceLevel,
      'rainIntensity': rainIntensity,
      'sleetIntensity': sleetIntensity,
      'snowIntensity': snowIntensity,
      'temperature': temperature,
      'temperatureApparent': temperatureApparent,
      'uvHealthConcern': uvHealthConcern,
      'uvIndex': uvIndex,
      'visibility': visibility,
      'weatherCode': weatherCode,
      'windDirection': windDirection,
      'windGust': windGust,
      'windSpeed': windSpeed,
    };
  }
}

