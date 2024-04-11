import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../style/typography.dart';

class DetailRow extends StatelessWidget {

  final String detailTitle;
  final String detailValue;
  final Color? leadingColor;

  const DetailRow({
    super.key,
    required this.detailTitle,
    required this.detailValue,
    this.leadingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 4,
      children: [

        //item title
        Row(
          children: [
            Text(
              detailTitle,
              style: TypographyStyles.getBodySmall(),
            ),
          ],
        ),

        //item value
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              //leading element (optional)
              Visibility(
                visible: leadingColor != null,
                child: Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  width: 2,
                  decoration: BoxDecoration(
                    color: leadingColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),

              //item value
              Text(
                detailValue,
                style: TypographyStyles.getTitleMedium(),
              ),
            ],
          ),
        )
      ]
    );
  }
}
