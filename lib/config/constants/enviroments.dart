import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static initEnvironment() async {
    await dotenv.load(fileName: '.env');
  }

  static String apiUrl = dotenv.env['API_URL_TOMRROWIO'] ?? 'No esta configurada la API_URL_TOMRROWIO';
  static String apiKey = dotenv.env['API_KEY_TOMRROWIO'] ?? 'No esta configurada la API_KEY_TOMRROWIO';
}