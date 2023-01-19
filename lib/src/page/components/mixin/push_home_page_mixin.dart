import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:training/src/page/weather_page.dart';

mixin PushHomePageMixin on State {
  final duration = Duration(milliseconds: 500);
  final schedulerBinding = SchedulerBinding.instance;

  @override
  void initState() {
    super.initState();
    loop();
  }

  FutureOr<void> loop([dynamic _]) {
    // Routeは毎度新しくないといけない。多分disposeしてるから。
    return Future.delayed(
      duration,
      () => schedulerBinding.endOfFrame
          .then((_) => Navigator.of(context).push(WeatherPage.route())),
    ).then<void>(loop);
  }
}
