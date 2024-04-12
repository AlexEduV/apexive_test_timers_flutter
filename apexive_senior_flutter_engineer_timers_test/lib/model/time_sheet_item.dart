
import 'dart:async';

import 'package:apexive_senior_flutter_engineer_timers_test/model/project.dart';

//substitute for a timer
//but the timer name is already taken by the OS;

class TimeSheetItem {
  final String description;
  final Project project;
  final String dateCreated;
  late String currentTime;
  late bool isActive;
  late bool isCompleted;
  final bool isFavorite;
  late Timer timer;

  TimeSheetItem({
    required this.description,
    required this.project,
    required this.dateCreated,
    required this.currentTime,
    required this.isActive,
    required this.isCompleted,
    required this.isFavorite,
    required this.timer,
  });

}
