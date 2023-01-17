import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:training/src/fcc.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required String weather_condition,
    int? max_temperature,
    int? min_temperature,
    DateTime? date,
  }) = _Weather;
  factory Weather.fromJson(Map<String, Object?> json) =>
      _$WeatherFromJson(json);
}

class Weathers extends FCC<Weather> with EquatableMixin {
  @override
  final List<Weather> values;

  Weathers(this.values);

  @override
  List<Object> get props => values;
}
