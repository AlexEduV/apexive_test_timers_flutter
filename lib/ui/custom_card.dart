import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {

  final Widget? child;

  const CustomCard({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    //a rounded semi-transparent container
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.08),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      child: child,
    );
  }
}
