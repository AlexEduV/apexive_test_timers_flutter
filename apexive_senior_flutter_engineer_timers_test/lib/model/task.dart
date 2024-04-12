import 'dart:async';

import 'package:apexive_senior_flutter_engineer_timers_test/model/project.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/time_sheet_item.dart';

class Task {
  final String title;
  final String description;
  final String assignedTo;
  final String deadlineDate;
  final String startTime;

  Task({
    required this.title,
    required this.description,
    required this.assignedTo,
    required this.deadlineDate,
    required this.startTime,
  });

}

