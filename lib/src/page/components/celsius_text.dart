import 'package:flutter/material.dart';

class CelsiusText extends StatelessWidget {
  final int? temperature;
  late final Color? color;

  CelsiusText(this.color, [this.temperature]);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          '${temperature is int ? temperature.toString() : "**"} ℃',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: color),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
