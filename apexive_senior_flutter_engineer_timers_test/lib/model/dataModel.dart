import 'package:apexive_senior_flutter_engineer_timers_test/model/task.dart';

class DataModel {
  List<Task> getInitTestTasks() {
    List<Task> initList = [];

    //add one test task
    initList.add(
        Task(
            title: 'iOS App Development with odd',
            projectName: 'SO056 - Booqio V2',
            deadlineDate: '07/20/2023',
            time: '00:30',
            isFavorite: false,
            isActive: false
        )
    );

    return initList;
  }
}