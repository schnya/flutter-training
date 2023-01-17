import 'package:flutter/cupertino.dart';
import 'package:training/src/domain/weather.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherState {
  Weather? weather;
  late Widget widget;

  WeatherState([this.weather]) {
    Widget child;
    switch (weather?.condition) {
      case ('cloudy'):
        child = SvgPicture.asset('docs/sessions/images/api/cloudy.svg');
        break;
      case ('rainy'):
        child = SvgPicture.asset('docs/sessions/images/api/rainy.svg');
        break;
      case ('sunny'):
        child = SvgPicture.asset('docs/sessions/images/api/sunny.svg');
        break;
      default:
        child = Placeholder();
    }

    widget = AspectRatio(aspectRatio: 1 / 1, child: child);
  }
}
