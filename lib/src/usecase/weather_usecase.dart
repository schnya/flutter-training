import 'package:training/src/domain/weather.dart';
import 'package:training/src/port/weather_port.dart';
import 'package:training/src/state/weather_state.dart';

class WeatherUsecase {
  final WeatherPort _weatherPort;

  WeatherUsecase(this._weatherPort);

  Future<WeatherState> reloadWeather() async {
    Weather weather = await _weatherPort.reloadWeather();
    return WeatherState(weather);
  }
}
