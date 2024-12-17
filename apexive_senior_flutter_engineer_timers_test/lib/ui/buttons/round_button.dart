
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final Color backgroundColor;
  final Color tintColor;
  final String iconSource;
  final Function() onButtonPressed;

  const RoundButton({
    super.key,
    required this.backgroundColor,
    required this.tintColor,
    required this.iconSource,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64.0),
        color: backgroundColor,
      ),
      child: IconButton(
        icon: Image.asset(
          iconSource,
          color: tintColor,
          height: 24,
          width: 24,
        ),
        onPressed: onButtonPressed,
      ),
    );
  }
}
