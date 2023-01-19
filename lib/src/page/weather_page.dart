import 'package:flutter/material.dart';
import 'package:training/src/gateway/weather_gateway.dart';
import 'package:training/src/page/components/reload_button.dart';
import 'package:training/src/page/components/weateher_forecast_panel.dart';
import 'package:training/src/state/weather_state.dart';
import 'package:training/src/usecase/weather_usecase.dart';

class WeatherPage extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (_) => WeatherPage());
  }

  @override
  State<WeatherPage> createState() => WeatherPageState();

  static WeatherPageState of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return (context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>())!
          .data;
    }

    return (context
            .getElementForInheritedWidgetOfExactType<MyInheritedWidget>()!
            .widget as MyInheritedWidget)
        .data;
  }
}

class WeatherPageState extends State<WeatherPage> {
  final WeatherUsecase weatherUsecase = WeatherUsecase(WeatherGateway());
  late WeatherState weatherState;

  @override
  void initState() {
    super.initState();
    weatherState = WeatherState();
  }

  void reload() async {
    WeatherState? state = await weatherUsecase.reloadWeather();
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
          child: MyInheritedWidget(
            data: this,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                WeatherForecastPanel(),
                Divider(height: 80, color: Colors.transparent),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: Navigator.of(context).pop,
                        child: Text('Close'),
                      ),
                    ),
                    Expanded(child: ReloadButton()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dummyDialog(BuildContext context) {
    return AlertDialog(
      content: Text('仮のテキスト'),
      actions: [
        TextButton(onPressed: Navigator.of(context).pop, child: Text('OK'))
      ],
    );
  }
}

// ① InheritedWidgetを継承したクラス
class MyInheritedWidget extends InheritedWidget {
  // ② 状態及び子要素をコンストラクタで受け取る
  const MyInheritedWidget({Key? key, required Widget child, required this.data})
      : super(key: key, child: child);

  final WeatherPageState data;

  // ④ 変更を通知するかしないかを制御
  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    return true;
  }
}
