
import 'dart:async';
import 'package:apexive_senior_flutter_engineer_timers_test/model/task.dart';

//substitute for a timer
//but the timer name is already taken by the OS;

class TimeSheetItem {
  final String description;
  final String dateCreated;
  final String startTime;
  late String currentTime;
  late bool isActive;
  late bool isCompleted;
  late Timer timer;

  TimeSheetItem({
    required this.description,
    required this.dateCreated,
    required this.startTime,
    required this.currentTime,
    required this.isActive,
    required this.isCompleted,
    required this.timer,
  });

}
