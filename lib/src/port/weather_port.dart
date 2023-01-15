import 'package:training/src/domain/weather.dart';

abstract class WeatherPort {
  Future<Weather> reloadWeather();
}
