import 'package:apexive_senior_flutter_engineer_timers_test/model/project.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/task.dart';
import 'package:flutter/material.dart';

class DataModel {
  List<Task> getInitTestTasks() {
    List<Task> initList = [];

    //add one test task
    initList.add(
        Task(
          title: 'iOS App Deployment with odd',
          project: Project(
            projectName: 'SO056 - Booqio V2',
            markerColor: const Color(0xffFFC629),
          ),
          deadlineDate: '07/20/2023',
          time: '00:30',
          isFavorite: false,
          isActive: false,
        )
    );

    initList.add(
        Task(
          title: 'iOS App Deployment',
          project: Project(
              projectName: 'SO056 - Booqio V2',
              markerColor: const Color(0xffFFC629),
          ),
          deadlineDate: '07/20/2023',
          time: '00:30',
          isFavorite: true,
          isActive: false,
        )
    );

    return initList;
  }
}
