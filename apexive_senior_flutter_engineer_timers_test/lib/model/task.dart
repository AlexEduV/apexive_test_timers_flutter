import 'package:apexive_senior_flutter_engineer_timers_test/model/project.dart';

class Task {
  final String title;
  final Project project;
  final String deadlineDate;
  final String time;
  final bool isFavorite;
  late bool isActive;
  late bool isCompleted;

  Task({
    required this.title,
    required this.project,
    required this.deadlineDate,
    required this.time,
    required this.isFavorite,
    required this.isActive,
    required this.isCompleted,
  });

}

