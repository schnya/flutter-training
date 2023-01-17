// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weather _$$_WeatherFromJson(Map<String, dynamic> json) => _$_Weather(
      weather_condition: json['weather_condition'] as String,
      max_temperature: json['max_temperature'] as int?,
      min_temperature: json['min_temperature'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      'weather_condition': instance.weather_condition,
      'max_temperature': instance.max_temperature,
      'min_temperature': instance.min_temperature,
      'date': instance.date?.toIso8601String(),
    };
