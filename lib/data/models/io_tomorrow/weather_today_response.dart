import 'package:weather_app/data/models/io_tomorrow/io_tomorrow.dart';

class WeatherTodayResponse {
  final Data data;
  final Location location;

  WeatherTodayResponse({required this.data, required this.location});

  factory WeatherTodayResponse.fromJson(Map<String, dynamic> json) {
    return WeatherTodayResponse(
      data: Data(
        time: DateTime.parse(json['data']['time']),
        values: WeatherData.fromJson(json['data']['values'])
      ),
      location: Location(
        latitude: json['location']['lat'],
        longitude: json['location']['lon'],
        city: json['location']['city']
      )
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'location': location.toJson()
    };
  }
}