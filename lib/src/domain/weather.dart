import 'package:equatable/equatable.dart';
import 'package:training/src/fcc.dart';

class Weather extends Equatable {
  final String condition;
  final int? maxTemperature;
  final int? minTemperature;
  final DateTime? date;

  Weather(
    this.condition, {
    this.maxTemperature,
    this.minTemperature,
    this.date,
  });
  factory Weather.fromJson(Map weather) {
    return Weather(
      weather["weather_condition"],
      maxTemperature: weather["max_temperature"],
      minTemperature: weather["min_temperature"],
      date: DateTime.tryParse(weather["date"]),
    );
  }

  @override
  List<Object> get props => [condition];
}

class Weathers extends FCC<Weather> with EquatableMixin {
  @override
  final List<Weather> values;

  Weathers(this.values);

  @override
  List<Object> get props => values;
}
