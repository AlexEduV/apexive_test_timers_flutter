
import 'dart:async';
import 'package:apexive_senior_flutter_engineer_timers_test/model/task.dart';

class TimeSheetItem {
  final Task task;
  final String description;
  final String deadlineDate;
  final String startTime;
  late String currentTime;
  late bool isActive;
  late bool isCompleted;
  late Timer timer;

  TimeSheetItem({
    required this.task,
    required this.description,
    required this.deadlineDate,
    required this.startTime,
    required this.currentTime,
    required this.isActive,
    required this.isCompleted,
    required this.timer,
  });

}
