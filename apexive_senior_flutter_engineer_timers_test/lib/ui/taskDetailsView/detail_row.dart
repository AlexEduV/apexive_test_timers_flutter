
import 'package:flutter/material.dart';

import '../../style/typography.dart';

class DetailRow extends StatelessWidget {

  final String detailTitle;
  final Color? leadingColor;
  final String detailValue;

  const DetailRow({
    super.key,
    required this.detailTitle,
    required this.detailValue,
    this.leadingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //item title
        Text(
          detailTitle,
          style: TypographyStyles.getBodySmall(),
        ),

        Row(
          children: [

            //leading element?
            Visibility(
              visible: leadingColor != null,
              child: Container(
                margin: const EdgeInsets.only(right: 8.0),
                width: 2,
                height: 24,
                //height: BoxConstraints.expand().maxHeight,
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
        )
      ]
    );
  }
}