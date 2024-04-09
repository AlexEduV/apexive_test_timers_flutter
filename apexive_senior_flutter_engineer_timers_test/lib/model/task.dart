import 'dart:async';

import 'package:apexive_senior_flutter_engineer_timers_test/model/project.dart';

class Task {
  final String title;
  final String description;
  final Project project;
  final String assignedTo;
  final String deadlineDate;
  final String startTime;
  late String currentTime;
  final bool isFavorite;
  late bool isActive;
  late bool isCompleted;
  late Timer timer;

  Task({
    required this.title,
    required this.description,
    required this.project,
    required this.assignedTo,
    required this.deadlineDate,
    required this.startTime,
    required this.currentTime,
    required this.isFavorite,
    required this.isActive,
    required this.isCompleted,
    required this.timer,
  });

}

