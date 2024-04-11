
import 'package:flutter/material.dart';

import '../../style/typography.dart';

class SplashButton extends StatelessWidget {

  final Function() onTap;
  final String label;

  const SplashButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.16),
            borderRadius: BorderRadius.circular(12.0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TypographyStyles.getLabelLarge(),
            )
          ],
        ),
      ),
    );
  }

}
