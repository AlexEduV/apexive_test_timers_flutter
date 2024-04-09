import 'package:flutter/material.dart';

class TimerSettingsRow extends StatelessWidget {

  final String text;
  final dynamic textStyle;

  final IconData icon;


  const TimerSettingsRow({
    super.key,
    required this.text,
    required this.textStyle,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      children: [
        Icon(icon, size: 24, color: Colors.white),

        Text(text, style: textStyle),
      ],
    );
  }
}
