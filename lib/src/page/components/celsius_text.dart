import 'package:flutter/material.dart';

class CelsiusText extends StatelessWidget {
  late final Color? color;

  CelsiusText(this.color);
  factory CelsiusText.color(Color? color) {
    return CelsiusText(color);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          '** ℃',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: color),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
