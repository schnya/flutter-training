import 'package:flutter/material.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

void main() {
  final yumemiWeather = YumemiWeather();

  final simpleVer = yumemiWeather.fetchSimpleWeather();
  print('Weather Condition: $simpleVer');

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(aspectRatio: 1 / 1, child: Placeholder()),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    '** ℃',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    '** ℃',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 80),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextButton(onPressed: () {}, child: Text('Close')),
              ),
              Expanded(
                child: TextButton(onPressed: () {}, child: Text('Reload')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
