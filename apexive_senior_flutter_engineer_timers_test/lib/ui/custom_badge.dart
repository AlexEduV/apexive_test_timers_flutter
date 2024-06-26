import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {

  final String text;

  const CustomBadge({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64.0),
        color: Colors.white.withOpacity(0.16),
      ),
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
