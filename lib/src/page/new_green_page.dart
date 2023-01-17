import 'package:flutter/material.dart';
import 'components/mixin/push_home_page_mixin.dart';

class NewGreenPage extends StatefulWidget {
  @override
  State createState() => _NewGreenPageState();
}

class _NewGreenPageState extends State with PushHomePageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.green);
  }
}
