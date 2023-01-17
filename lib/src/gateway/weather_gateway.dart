import 'package:training/src/domain/weather.dart';
import 'package:training/src/port/weather_port.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherGateway implements WeatherPort {
  final yumemiWeather = YumemiWeather();

  @override
  Future<Weather?> reloadWeather() async {
    try {
      final throwsVer = yumemiWeather.fetchThrowsWeather('tokyo');
      print('Weather Condition: $throwsVer');
      return Weather(throwsVer);
    } on YumemiWeatherError catch (e) {
      print('Throws: $e');
      return null;
    }
  }
}
