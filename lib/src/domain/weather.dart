import 'package:equatable/equatable.dart';
import 'package:training/src/fcc.dart';

class WeatherName extends Equatable {
  final String value;

  WeatherName(this.value);

  @override
  List<Object> get props => [value];
}

class Weather extends Equatable {
  final WeatherName name;

  Weather(this.name);

  @override
  List<Object> get props => [name];
}

class Weathers extends FCC<Weather> with EquatableMixin {
  @override
  final List<Weather> values;

  Weathers(this.values);

  @override
  List<Object> get props => values;
}
