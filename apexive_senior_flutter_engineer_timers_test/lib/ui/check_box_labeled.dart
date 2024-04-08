import 'package:flutter/material.dart';

import '../style/typography.dart';

class CheckBoxLabeled extends StatefulWidget {

  final bool isFavorite;
  final String label;

  const CheckBoxLabeled({
    super.key,
    required this.isFavorite,
    required this.label
  });

  @override
  State<CheckBoxLabeled> createState() => _CheckBoxLabeledState();

}

class _CheckBoxLabeledState extends State<CheckBoxLabeled> {

  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isFavorite,
          onChanged: (bool? value) {
            setState(() {
              isFavorite = value!;
            });
          },
          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            return Colors.white;
          }),
          checkColor: Colors.indigo,
        ),

        Expanded(
            child: Row(
              children: [
                Text(
                  widget.label,
                  style: TypographyStyles().getBodyLarge(),
                ),
              ],
            )
        )
      ],
    );
  }
}
