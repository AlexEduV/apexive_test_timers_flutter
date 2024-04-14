import 'package:flutter/material.dart';

class TimerSpecsRow extends StatelessWidget {

  final String text;
  final dynamic textStyle;

  final IconData? icon;
  final String? iconSource;


  const TimerSpecsRow({
    super.key,
    required this.text,
    required this.textStyle,
    this.icon,
    this.iconSource,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getImageOrIcon(icon, iconSource),

        const SizedBox(width: 4,),

        Flexible(child: Text(text, style: textStyle,),),
      ],
    );
  }

  Widget getImageOrIcon(IconData? icon, String? iconSource)
  {

    if (icon != null) {

      return Icon(icon, size: 24, color: Colors.white);
    }
    else {

      return SizedBox(
        height: 24,
        width: 24,
        child: Center(
          child: Image.asset(
            iconSource ?? 'assets/images/arrow_2_circlepath',
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
