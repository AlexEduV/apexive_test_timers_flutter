
import 'package:flutter/material.dart';

class TimesheetSpecsColumn extends StatelessWidget {
  
  final String deadlineDate;
  final String dayOfWeek;
  final String startTime;

  const TimesheetSpecsColumn({
    required this.dayOfWeek,
    required this.deadlineDate,
    required this.startTime,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {

    return Wrap(
      direction: Axis.vertical,
      spacing: 4,

      children: [
        Text(
          dayOfWeek,
          style: Theme.of(context).textTheme.bodySmall,
        ),

        Text(
          deadlineDate,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        Text(
          'Start Time $startTime',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
