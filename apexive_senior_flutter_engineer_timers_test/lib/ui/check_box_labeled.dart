import 'package:flutter/material.dart';

import '../style/typography.dart';

class CheckBoxLabeled extends StatefulWidget {

  final bool isFavorite;
  final String label;
  final Function(bool?) onChanged;


  const CheckBoxLabeled({
    super.key,
    required this.isFavorite,
    required this.label,
    required this.onChanged,
  });

  @override
  State<CheckBoxLabeled> createState() => _CheckBoxLabeledState();

}

class _CheckBoxLabeledState extends State<CheckBoxLabeled> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.isFavorite,
          onChanged: widget.onChanged,
          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            return Colors.white;
          }),
          checkColor: Colors.indigo,
        ),

        Text(
          widget.label,
          style: TypographyStyles.getBodyLarge(),
        )
      ],
    );
  }
}
