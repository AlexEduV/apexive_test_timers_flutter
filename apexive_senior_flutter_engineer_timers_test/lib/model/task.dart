class Task {
  final String title;
  final String projectName;
  final String deadlineDate;
  final String time;
  final bool isFavorite;
  late bool isActive;

  Task({
    required this.title,
    required this.projectName,
    required this.deadlineDate,
    required this.time,
    required this.isFavorite,
    required this.isActive,
  });

}

