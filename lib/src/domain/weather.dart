import 'package:equatable/equatable.dart';
import 'package:training/src/fcc.dart';

class Weather extends Equatable {
  final String name;

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
