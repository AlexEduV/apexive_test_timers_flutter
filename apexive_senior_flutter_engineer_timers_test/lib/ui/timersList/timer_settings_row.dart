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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 24, color: Colors.white),

        const SizedBox(width: 4,),

        Flexible(child: Text(text, style: textStyle)),
      ],
    );
  }
}
