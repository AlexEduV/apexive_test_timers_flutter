import 'dart:async';

import 'package:apexive_senior_flutter_engineer_timers_test/model/project.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/task.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/time_sheet_item.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/user.dart';
import 'package:flutter/material.dart';

class DataModel {

  static List<TimeSheetItem> timeSheetList = [];

  static List<TimeSheetItem> getInitTestTimeSheets() {
    timeSheetList = [];

    Project testProject = Project(
        projectName: 'SO056 - Booqio V2',
        markerColor: const Color(0xffFFC629),
    );

    User testUser = const User(
      firstName: 'Alex',
      lastName: 'Ivanov',
    );

    Task testTask = Task(
      title: 'iOS App Deployment with odd',
      description: 'Sync with Client, communicate, '
          'work on the new design with designer, '
          'new tasks preparation call with the front end',
      assignedTo: '${testUser.firstName} ${testUser.lastName}',
      deadlineDate: '20.07.2024',
      startTime: '00:30',
    );

    Task testTask1 = Task(
      title: 'iOS App Deployment',
      description: 'Sync with Client, communicate, '
          'work on the new design with designer, '
          'new tasks preparation call with the front end',
      assignedTo: '${testUser.firstName} ${testUser.lastName}',
      deadlineDate: '20.07.2024',
      startTime: '00:30',
    );

    //add test tasks here:
    timeSheetList.add(
      TimeSheetItem(
          description: 'A sample TimeSheet',
          project: testProject,
          task: testTask,
          dateCreated: '12.04.2024',
          currentTime: testTask.startTime,
          isActive: false,
          isCompleted: false,
          isFavorite: false,
          timer:  Timer(Duration.zero, (){}),
      )
    );

    timeSheetList.add(
      TimeSheetItem(
        description: 'A sample TimeSheet description',
        project: testProject,
        task: testTask1,
        dateCreated: '12.04.2024',
        currentTime: testTask1.startTime,
        isActive: false,
        isCompleted: false,
        isFavorite: true,
        timer:  Timer(Duration.zero, (){}),
      )
    );

    return timeSheetList;
  }

  static Task getTaskByName(String taskName)
  {
    for (final timeSheet in timeSheetList)
    {
      if (timeSheet.task.title == taskName)
      {
        return timeSheet.task;
      }
    }

    return timeSheetList.first.task;
  }

  static Project getProjectByName(String projectName)
  {
    for (final timeSheet in timeSheetList)
    {
      if (timeSheet.project.projectName == projectName)
      {
        return timeSheet.project;
      }
    }

    return timeSheetList.first.project;
  }

  static int getTimersCount()
  {
    return timeSheetList.length;
  }

  static int getNotCompletedTimersCount()
  {
    int result = 0;

    for (final timeSheet in timeSheetList)
    {
      if (!timeSheet.isCompleted)
      {
        result++;
      }
    }

    return result;
  }

  static List<TimeSheetItem> getAllTimeSheetsForTask(Task task)
  {
    List<TimeSheetItem> result = [];

    for (final timeSheet in timeSheetList)
    {
      if (timeSheet.task == task)
      {
        result.add(timeSheet);
      }
    }

    return result;
  }
}
