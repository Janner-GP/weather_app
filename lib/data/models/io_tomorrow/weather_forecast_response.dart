import 'package:weather_app/data/models/io_tomorrow/io_tomorrow.dart';

class WeatherForecastResponse {
  final TimeLines timeline;
  final Location location;

  WeatherForecastResponse({required this.timeline, required this.location});

  factory WeatherForecastResponse.fromJson(Map<String, dynamic> json) {
    return WeatherForecastResponse(
      timeline: TimeLines.fromJson(json['timelines']),
      location: Location(
        latitude: json['location']['lat'],
        longitude: json['location']['lon'],
        city: json['location']['city']
      )
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timeline': timeline.toJson(),
      'location': location.toJson()
    };
  }

}

class TimeLines {
  final List<Data> minutely;
  final List<Data> hourly;
  final List<Data> daily;

  TimeLines({required this.minutely, required this.hourly, required this.daily});

  factory TimeLines.fromJson(Map<String, dynamic> json) {
    return TimeLines(
      minutely: List<Data>.from(json['minutely'].map((x) => Data.fromJson(x))),
      hourly: List<Data>.from(json['hourly'].map((x) => Data.fromJson(x))),
      daily: List<Data>.from(json['daily'].map((x) => Data.fromJson(x)))
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'minutely': List<dynamic>.from(minutely.map((x) => x.toJson())),
      'hourly': List<dynamic>.from(hourly.map((x) => x.toJson())),
      'daily': List<dynamic>.from(daily.map((x) => x.toJson()))
    };
  }
}