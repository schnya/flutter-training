import 'package:flutter/material.dart';
import 'package:training/src/gateway/weather_gateway.dart';
import 'package:training/src/page/components/celsius_text.dart';
import 'package:training/src/state/weather_state.dart';
import 'package:training/src/usecase/weather_usecase.dart';

class MyHomePage extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (_) => MyHomePage());
  }

  final WeatherUsecase weatherUsecase = WeatherUsecase(WeatherGateway());

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WeatherState weatherState;

  @override
  void initState() {
    super.initState();
    weatherState = WeatherState();
  }

  void reload() async {
    WeatherState? state = await widget.weatherUsecase.reloadWeather();
    if (state is WeatherState) {
      weatherState = state;
      setState(() {});
    } else {
      showDialog(context: context, builder: dummyDialog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              weatherState.widget,
              Row(children: [
                CelsiusText(Colors.blue, weatherState.weather?.minTemperature),
                CelsiusText(Colors.red, weatherState.weather?.maxTemperature)
              ]),
              SizedBox(height: 80),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: Text('Close'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: reload,
                      child: Text('Reload'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dummyDialog(BuildContext context) {
    return AlertDialog(
      content: Text('仮のテキスト'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        )
      ],
    );
  }
}
