import 'dart:async';

import 'package:apexive_senior_flutter_engineer_timers_test/model/project.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/task.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/time_sheet_item.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/user.dart';
import 'package:flutter/material.dart';

class DataModel {

  static List<Task> taskList = [];

  static List<Task> getInitTestTasks() {
    taskList = [];

    Project testProject = Project(
        projectName: 'SO056 - Booqio V2',
        markerColor: const Color(0xffFFC629),
    );

    User testUser = const User(
      firstName: 'Alex',
      lastName: 'Ivanov',
    );

    //add one test task
    taskList.add(
        Task(
          title: 'iOS App Deployment with odd',
          description: 'Sync with Client, communicate, '
              'work on the new design with designer, '
              'new tasks preparation call with the front end',
          project: testProject,
          assignedTo: '${testUser.firstName} ${testUser.lastName}',
          deadlineDate: '07/20/2024',
          startTime: '00:30',
          timers: [
            TimeSheetItem(
                description: 'A timer for a task',
                dateCreated: '04/12/2024',
                currentTime: '00:30',
                project: testProject,
                isActive: false,
                isFavorite:  false,
                isCompleted: false,
                timer: Timer(Duration.zero, (){}),
            ),
          ],
        )
    );

    taskList.add(
        Task(
          title: 'iOS App Deployment',
          description: 'Sample Task',
          project: testProject,
          assignedTo: '${testUser.firstName} ${testUser.lastName}',
          deadlineDate: '07/20/2024',
          startTime: '00:30',
          timers: [
            TimeSheetItem(
              description: 'A timer for a task',
              dateCreated: '04/12/2024',
              currentTime: '00:30',
              project: testProject,
              isActive: false,
              isFavorite: true,
              isCompleted: false,
              timer: Timer(Duration.zero, (){}),
            ),
          ],
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

  static int getTimersCount()
  {
    int result = 0;

    for (final task in taskList)
    {
      result += task.timers.length;
    }

    return result;
  }

  // static int getNotCompletedTasksCount()
  // {
  //   int result = 0;
  //
  //   for (final task in taskList)
  //   {
  //     if (!task.isCompleted)
  //     {
  //       result++;
  //     }
  //   }
  //
  //   return result;
  // }
}
