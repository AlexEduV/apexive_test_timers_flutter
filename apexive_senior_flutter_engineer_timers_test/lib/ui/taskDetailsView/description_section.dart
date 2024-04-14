
import 'package:flutter/material.dart';

import '../../helpers/text_helper.dart';
import '../../style/typography.dart';

class DescriptionSection extends StatelessWidget {

  final Function() onEditButtonPressed;
  final String descriptionText;

  final bool isReadMoreExpanded;
  final Function() onReadMoreButtonPressed;

  const DescriptionSection({
    super.key,
    required this.onEditButtonPressed,
    required this.descriptionText,
    required this.isReadMoreExpanded,
    required this.onReadMoreButtonPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Description',
                style: TypographyStyles.getBodySmall(),
              ),

              IconButton(
                onPressed: onEditButtonPressed,
                icon: Image.asset(
                  'assets/images/pencil.png',
                  height: 24,
                  width: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4,),

          Text(
            descriptionText,
            style: TypographyStyles.getBodyMedium(),
            maxLines: isReadMoreExpanded ? 10 : 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 4,),

          Visibility(
            visible: !isReadMoreExpanded && hasTextOverflow(
              descriptionText,
              TypographyStyles.getBodyMedium(),
              MediaQuery.of(context).textScaleFactor,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: GestureDetector(
              onTap: onReadMoreButtonPressed,
              child: Text(
                'Read More',
                style: TypographyStyles.getBodySmall(),
              ),
            ),
          ),
        ]
    );
  }
}
