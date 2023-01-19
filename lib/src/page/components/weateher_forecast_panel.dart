import 'package:flutter/material.dart';
import 'package:training/src/page/weather_page.dart';

import 'celsius_text.dart';

class WeatherForecastPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WeatherPageState state = WeatherPage.of(context);
    return Column(
      children: [
        state.weatherState.widget,
        Row(children: [
          CelsiusText(Colors.blue, state.weatherState.weather?.min_temperature),
          CelsiusText(Colors.red, state.weatherState.weather?.max_temperature)
        ]),
      ],
    );
  }
}
