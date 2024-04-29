
import 'package:apexive_senior_flutter_engineer_timers_test/helpers/text_helper.dart';
import 'package:flutter/material.dart';

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
                style: Theme.of(context).textTheme.bodySmall,
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
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: isReadMoreExpanded ? 10 : 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 4,),

          Visibility(
            visible: !isReadMoreExpanded && hasTextOverflow(
              descriptionText,
              Theme.of(context).textTheme.bodyMedium!,
              MediaQuery.of(context).textScaleFactor,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: GestureDetector(
              onTap: onReadMoreButtonPressed,
              child: Text(
                'Read More',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ],
    );
  }
}
