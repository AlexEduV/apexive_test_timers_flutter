import 'package:flutter/material.dart';

class CustomPageBackground extends StatelessWidget {

  final Widget child;

  const CustomPageBackground({
    super.key,
    required this.child,
  });


  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1c2658), // Start Color
              Color(0xff364fc7), // End Color
            ],
          ),
        ),
      child: child,
    );
  }
}
