import 'dart:async';

import 'package:apexive_senior_flutter_engineer_timers_test/model/project.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/task.dart';
import 'package:flutter/material.dart';

class DataModel {

  static List<Task> taskList = [];

  List<Task> getInitTestTasks() {
    taskList = [];

    Project testProject = Project(
        projectName: 'SO056 - Booqio V2',
        markerColor: const Color(0xffFFC629),
    );

    //add one test task
    taskList.add(
        Task(
          title: 'iOS App Deployment with odd',
          description: 'Sample Task',
          project: testProject,
          deadlineDate: '07/20/2023',
          time: '00:30',
          isFavorite: false,
          isActive: false,
          isCompleted: false,
          timer: Timer(Duration.zero, (){}),
        )
    );

    taskList.add(
        Task(
          title: 'iOS App Deployment',
          description: 'Sample Task',
          project: testProject,
          deadlineDate: '07/20/2023',
          time: '00:30',
          isFavorite: true,
          isActive: false,
          isCompleted: false,
          timer: Timer(Duration.zero, (){}),
        )
    );

    return taskList;
  }
}
