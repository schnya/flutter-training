import 'package:flutter/material.dart';
import 'package:training/src/page/new_green_page.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

void main() {
  final yumemiWeather = YumemiWeather();

  try {
    final throwsVer = yumemiWeather.fetchThrowsWeather('tokyo');
    print('Weather Condition: $throwsVer');
  } on YumemiWeatherError catch (e) {
    print('Throws: $e');
  }

  try {
    final jsonString = '''
{
    "area": "tokyo",
    "date": "2020-04-01T12:00:00+09:00"
}''';
    final weather = yumemiWeather.fetchWeather(jsonString);
    print('Weather: $weather');
  } on YumemiWeatherError catch (e) {
    print('Throws: $e');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(useMaterial3: true),
      home: NewGreenPage(),
    );
  }
}
