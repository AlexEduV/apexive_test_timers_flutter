import 'dart:async';

import 'package:apexive_senior_flutter_engineer_timers_test/model/project.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/task.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/user.dart';
import 'package:flutter/material.dart';

class DataModel {

  static List<Task> taskList = [];

  List<Task> getInitTestTasks() {
    taskList = [];

    Project testProject = Project(
        projectName: 'SO056 - Booqio V2',
        markerColor: const Color(0xffFFC629),
    );

    User testUser = User(name: 'Alex Ivanov');

    //add one test task
    taskList.add(
        Task(
          title: 'iOS App Deployment with odd',
          description: 'Sample Task',
          project: testProject,
          assignedTo: testUser.name,
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
          assignedTo: testUser.name,
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

  static Task getTaskByName(String taskName)
  {
    for (final task in taskList)
    {
      if (task.title == taskName)
      {
        return task;
      }
    }

    return taskList.first;
  }

  static Project getProjectByName(String projectName)
  {
    for (final task in taskList)
    {
      if (task.project.projectName == projectName)
      {
        return task.project;
      }
    }

    return taskList.first.project;
  }
}
