import 'dart:async';

import 'package:apexive_senior_flutter_engineer_timers_test/model/data_model.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/time_sheet_item.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/appBar/custom_app_bar.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/buttons/round_button.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/custom_badge.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/custom_page_background.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/taskDetailsView/description_section.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/taskDetailsView/detail_row.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/taskDetailsView/timesheet_specs_column.dart';
import 'package:flutter/material.dart';

import '../helpers/date_helper.dart';
import '../model/task.dart';
import '../ui/custom_card.dart';


class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({super.key});

  static const routeName = '/TaskDetailsActivity';

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {

  //time constants
  static const oneSecond = Duration(seconds: 1);

  int selectedTabPageIndex = 0;

  late int timerId;
  late Task openedTask;

  List<bool> readMore = [];

  List<TimeSheetItem> completedTimeSheets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(

        child: CustomPageBackground(

          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Column(
              children: [

                //app bar - user's name & edit button
                CustomAppBar(
                  onBackButtonPressed: onBackButtonPressed,
                  title: '${openedTask.title} - ${openedTask.assignedTo}',
                  titleTextStyle: Theme.of(context).textTheme.titleMedium!,
                  actions: [
                    IconButton(
                      onPressed: onMoreButtonPressed,
                      icon: Image.asset(
                        'assets/images/pencil.png',
                        height: 24,
                        width: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                //tab bar - timesheets & details
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                      bottom: BorderSide(
                        width: 1.0,
                        color: Colors.white.withOpacity(.16),
                      ),),
                  ),
                  child: DefaultTabController(
                    initialIndex: 0,
                    length: 2,
                    child: TabBar(
                      onTap: (int index) {
                        setState(() {
                          selectedTabPageIndex = index;
                        });
                      },
                      tabs: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Tab(text: 'Timesheets',),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Tab(text: 'Details',),
                        ),
                      ],
                    ),
                  ),
                ),
                  
                //selected tab view
                Expanded(child: getTabPage(selectedTabPageIndex),),

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //get timer id from the route arguments;
    timerId = ModalRoute.of(context)?.settings.arguments as int;

    //set current timer data
    setState(() {
      openedTask = DataModel.timeSheetList[timerId].task;

      //get 'completed' list items
      completedTimeSheets = DataModel.getCompletedTimeSheetsForTask(openedTask);

      //reset 'read more' button state
      readMore = List.filled(DataModel.getAllTimeSheetsForTask(openedTask).length, false);

    });

    //initialize timer
    if (DataModel.timeSheetList[timerId].timer.isActive) {
      initTimer();
    }
  }

  @override
  void dispose() {

    /// MARK: Warning
    /// be careful with updating static global info using dispose(),
    /// because it runs the code some time after the window had switched;

    super.dispose();
  }

  Widget getTabPage(int selectedIndex) {

    //timesheets view
    if (selectedIndex == 0) {

      return SingleChildScrollView(
        child: Column(
          children: [

            //running task detailed view
            Visibility(
              visible: !DataModel.timeSheetList[timerId].isCompleted,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CustomCard(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      TimesheetSpecsColumn(
                        dayOfWeek: getWeekDayFromDate(DataModel.timeSheetList[timerId].dateCreated),
                        deadlineDate: DataModel.timeSheetList[timerId].dateCreated,
                        startTime: openedTask.startTime,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            //time text
                            Text(
                              DataModel.timeSheetList[timerId].currentTime,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),

                            //control buttons
                            Wrap(
                              spacing: 16,
                              children: [

                                //stop button
                                RoundButton(
                                  backgroundColor: Colors.white.withOpacity(0.16),
                                  tintColor: Colors.white,
                                  iconSource: 'assets/images/stop_fill.png',
                                  onButtonPressed: onStopButtonPressed,
                                ),

                                //pause button
                                RoundButton(
                                  backgroundColor: DataModel.timeSheetList[timerId].isActive
                                      ? Colors.white : Colors.white.withOpacity(0.16),
                                  tintColor: DataModel.timeSheetList[timerId].isActive
                                      ? Colors.black : Colors.white,
                                  iconSource: DataModel.timeSheetList[timerId].isActive
                                      ? 'assets/images/pause-1.png'
                                      : 'assets/images/play_arrow_solid.png',
                                  onButtonPressed: onPauseButtonPressed,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //Description section
                      Divider(height: 1, color: Colors.white.withOpacity(0.16),),

                      const SizedBox(height: 16.0,),

                      DescriptionSection(
                          onEditButtonPressed: onEditDescriptionButtonPressed,
                          descriptionText: DataModel.timeSheetList[timerId].description,
                          isReadMoreExpanded: readMore[0],
                          onReadMoreButtonPressed: () {
                            setState(() {
                              readMore[0] = !readMore[0];
                            });
                          },
                      ),

                    ],
                  ),
                ),
              ),
            ),

            //completed records listview
            Visibility(
              visible: completedTimeSheets.isNotEmpty,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Completed Records',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),

                  const SizedBox(height: 8,),

                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: _getCompletedItemListTile,
                    itemCount: completedTimeSheets.length,
                  ),
                ],
              ),
            ),

          ],
        ),
      );

    }
    //details view
    else if (selectedIndex == 1) {

      //task overview
      return SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: CustomCard(

                //task details
                child: Wrap(
                  runSpacing: 16,
                  children: [

                    //Project
                    DetailRow(
                      detailTitle: 'Project',
                      detailValue: DataModel.timeSheetList[timerId].project.projectName,
                      leadingColor: DataModel.timeSheetList[timerId].project.markerColor,
                    ),

                    //Deadline
                    DetailRow(
                      detailTitle: 'Deadline',
                      detailValue: openedTask.deadlineDate,
                    ),

                    //Assign To
                    DetailRow(
                      detailTitle: 'Assigned to',
                      detailValue: openedTask.assignedTo,
                    ),

                  ],
                ),
              ),
            ),

            //task description
            CustomCard(

              child: Wrap(
                runSpacing: 4,
                children: [

                  Row(
                    children: [
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),

                  Text(
                    openedTask.description,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),

                ],
              ),
            ),

          ],
        ),
      );
    }

    //if unknown index
    return Container();
  }

  Widget _getCompletedItemListTile(BuildContext context, int index)
  {
    return CustomCard(
        child: Row(
          children: [

            //check mark rounded
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(64.0),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(1.0),
              child: const Icon(
                Icons.check, size: 22, color: Colors.indigo,),
            ),

            const SizedBox(width: 8,),

            //timer details column
            Expanded(
              child: TimesheetSpecsColumn(
                dayOfWeek: getWeekDayFromDate(completedTimeSheets[index].dateCompleted),
                deadlineDate: completedTimeSheets[index].dateCompleted,
                startTime: openedTask.startTime,
              ),
            ),
    
            //completion time rounded
            CustomBadge(
              text: completedTimeSheets[index].currentTime,
            ),

          ],
        ),
    );
  }

  void onBackButtonPressed() {

    //cancel the timer
    DataModel.timeSheetList[timerId].timer.cancel();

    //route back to the home page;
    Navigator.pop(context);
  }
  
  void onMoreButtonPressed() {
    
  }

  void onStopButtonPressed() {

    //stop the timer
    DataModel.timeSheetList[timerId].timer.cancel();

    setState(() {
      DataModel.timeSheetList[timerId].isCompleted = true;
      DataModel.timeSheetList[timerId].isActive = false;

      DataModel.timeSheetList[timerId].dateCompleted = getTodayDateString();

      //update listView
      completedTimeSheets = DataModel.getCompletedTimeSheetsForTask(openedTask);
      debugPrint('completed list length: ${completedTimeSheets.length}');

      //todo: maybe we don't need to reset descriptions when stopping the timer;
      //readMore = List.filled(DataModel.getAllTimeSheetsForTask(openedTask).length, false);

    });
  }

  void onPauseButtonPressed() {

    //start/stop timer
    //stop timer if active
    if (DataModel.timeSheetList[timerId].timer.isActive) {
      DataModel.timeSheetList[timerId].timer.cancel();
    }
    else {
      initTimer();
    }

    //update UI
    setState(() {
      DataModel.timeSheetList[timerId].isActive = !DataModel.timeSheetList[timerId].isActive;
    });
  }

  void initTimer() {
    //start a timer
    int minutes = int.parse(DataModel.timeSheetList[timerId].currentTime.substring(0, 2));
    int seconds = int.parse(DataModel.timeSheetList[timerId].currentTime.substring(3, 5));

    int startingPoint = minutes * 60 + seconds;

    DataModel.timeSheetList[timerId].timer = Timer.periodic(oneSecond, (Timer timer) {
      if (startingPoint == 0) {

        //the task is finished
        timer.cancel();

        setState(() {
          DataModel.timeSheetList[timerId].isActive = false;
          DataModel.timeSheetList[timerId].isCompleted = true;

          DataModel.timeSheetList[timerId].dateCompleted = getTodayDateString();

          //update listView
          completedTimeSheets = DataModel.getCompletedTimeSheetsForTask(openedTask);
        });

      }
      else {
        startingPoint--;

        minutes = startingPoint ~/ Duration.minutesPerHour;
        seconds = startingPoint % Duration.secondsPerMinute;

        //update time
        setState(() {
          DataModel.timeSheetList[timerId].currentTime =
          '${minutes.toString().padLeft(2, "0")}'
              ':${seconds.toString().padLeft(2, "0")}';
        });
      }
    });
  }

  void onEditDescriptionButtonPressed() {}

}
