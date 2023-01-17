import 'dart:convert';

import 'package:training/src/domain/weather.dart';
import 'package:training/src/port/weather_port.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherGateway implements WeatherPort {
  final yumemiWeather = YumemiWeather();

  @override
  Future<Weather?> reloadWeather() async {
    try {
      final jsonString = '''
{
    "area": "tokyo",
    "date": "2023-01-17T12:00:00+09:00"
}''';
      final encodedWeather = yumemiWeather.fetchWeather(jsonString);
      print('Weather: $encodedWeather');
      final weather = jsonDecode(encodedWeather) as Map;
      return Weather.fromJson(weather);
    } on YumemiWeatherError catch (e) {
      print('Throws: $e');
      return null;
    }
  }
}
