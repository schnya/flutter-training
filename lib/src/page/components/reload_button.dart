import 'package:flutter/material.dart';
import 'package:training/src/page/weather_page.dart';

class ReloadButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: WeatherPage.of(context).reload,
      child: Text('Reload'),
    );
  }
}
