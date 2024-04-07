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
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: Colors.white),
          
          const Padding(padding: EdgeInsets.only(right: 4.0),),
          
          Flexible(
            child: Column(
              children: [
                Text(text, style: textStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
