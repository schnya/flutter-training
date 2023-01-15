import 'package:training/src/domain/weather.dart';
import 'package:training/src/port/weather_port.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherGateway implements WeatherPort {
  final yumemiWeather = YumemiWeather();

  @override
  Future<Weather> reloadWeather() async {
    final simpleVer = yumemiWeather.fetchSimpleWeather();
    print('Weather Condition: $simpleVer');
    return Weather(simpleVer);
  }
}
