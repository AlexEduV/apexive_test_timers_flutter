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
            if (states.contains(MaterialState.selected)) {
              return Colors.white;
            }

            return Colors.transparent;
          }),
          checkColor: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          side: MaterialStateBorderSide.resolveWith(
                (states) => const BorderSide(width: 2.0, color: Colors.white),
          ),
        ),

        Text(
          widget.label,
          style: TypographyStyles.getBodyLarge(),
        )
      ],
    );
  }
}
