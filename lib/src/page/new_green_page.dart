import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:training/src/page/home_page.dart';

class NewGreenPage extends StatefulWidget {
  @override
  State<NewGreenPage> createState() => _NewGreenPageState();
}

class _NewGreenPageState extends State<NewGreenPage> {
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
          .then((_) => Navigator.of(context).push(MyHomePage.route())),
    ).then<void>(loop);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.green);
  }
}
