
import 'package:flutter/cupertino.dart';

import '../../style/typography.dart';

class TimesheetSpecsColumn extends StatelessWidget {
  
  final String deadlineDate;
  final String dayOfWeek;
  final String startTime;

  const TimesheetSpecsColumn({
    super.key,
    required this.dayOfWeek,
    required this.deadlineDate,
    required this.startTime,
  });
  
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 4,

      children: [
        Text(
          dayOfWeek,
          style: TypographyStyles.getBodySmall(),
        ),

        Text(
          deadlineDate,
          style: TypographyStyles.getTitleMedium(),
        ),

        Text(
          'Start Time $startTime',
          style: TypographyStyles.getBodySmall(),
        ),
      ],
    );
  }
  
}
