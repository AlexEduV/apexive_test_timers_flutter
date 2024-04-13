import 'dart:async';

import 'package:apexive_senior_flutter_engineer_timers_test/model/data_model.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/time_sheet_item.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/appBar/custom_app_bar.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/buttons/round_button.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/taskDetailsView/detail_row.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/taskDetailsView/timesheet_specs_column.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';

import '../model/task.dart';
import '../style/typography.dart';
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

  int timerId = 0;
  late TimeSheetItem mainItem;
  late Task openedTask;

  List<TimeSheetItem> completedTimeSheets = [];

  List<bool> readMore = [];

  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //get timer id from the route arguments;
    timerId = ModalRoute.of(context)?.settings.arguments as int;

    //set current timer data
    setState(() {
      mainItem = DataModel.timeSheetList[timerId];
      openedTask = mainItem.task;

      completedTimeSheets = DataModel.getCompletedTimeSheetsForTask(openedTask);

      readMore = List.filled(DataModel.getAllTimeSheetsForTask(openedTask).length, false);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter, // Start direction
              end: Alignment.bottomCenter, // End direction
              colors: [
                Color(0xff1c2658), // Start Color
                Color(0xff364fc7),// End Color
              ], // Customize your colors here
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Column(
              children: [

                //app bar - user's name & edit button
                CustomAppBar(
                  onBackButtonPressed: onBackButtonPressed,
                  title: '${openedTask.title} - ${openedTask.assignedTo}',
                  titleTextStyle: TypographyStyles.getTitleMedium(),
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

  Widget getTabPage(int selectedIndex) {

    //timesheets view
    if (selectedIndex == 0) {

      return SingleChildScrollView(
        child: Column(
          children: [

            //task detail view
            Visibility(
              visible: !mainItem.isCompleted,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CustomCard(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      TimesheetSpecsColumn(
                        dayOfWeek: getWeekDayFromDate(mainItem.dateCreated),
                        deadlineDate: mainItem.dateCreated,
                        startTime: openedTask.startTime,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            //time text
                            Text(
                              mainItem.currentTime,
                              style: TypographyStyles.getDisplaySmall(),
                            ),

                            //control buttons
                            Wrap(
                              spacing: 16,
                              children: [

                                //stop button
                                RoundButton(
                                  backgroundColor: Colors.white.withOpacity(.16),
                                  tintColor: Colors.white,
                                  iconSource: 'assets/images/stop_fill.png',
                                  onButtonPressed: onStopButtonPressed
                                ),

                                //pause button
                                RoundButton(
                                  backgroundColor: mainItem.isActive
                                      ? Colors.white : Colors.white.withOpacity(.16),
                                  tintColor: mainItem.isActive
                                      ? Colors.black : Colors.white,
                                  iconSource: mainItem.isActive
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
                      Divider(height: 1, color: Colors.white.withOpacity(.16),),

                      const SizedBox(height: 16.0,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Description',
                                style: TypographyStyles.getBodySmall(),
                              ),

                              IconButton(
                                onPressed: onEditDescriptionButtonPressed,
                                icon: Image.asset(
                                  'assets/images/pencil.png',
                                  height: 24,
                                  width: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 4,),

                          Text(
                            mainItem.description,
                            style: TypographyStyles.getBodyMedium(),
                            maxLines: readMore[0] ? 10 : 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 4,),

                          Visibility(
                            visible: !readMore[0] && hasTextOverflow(
                              mainItem.description,
                              TypographyStyles.getBodyMedium(),
                              MediaQuery.of(context).textScaleFactor,
                              maxWidth: MediaQuery.of(context).size.width,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  readMore[0] = !readMore[0];
                                });
                              },
                              child: Text(
                                'Read More',
                                style: TypographyStyles.getBodySmall(),
                              ),
                            ),
                          ),

                         ]
                      ),

                    ],
                  ),
                ),
              ),
            ),

            //completed records listview
            Visibility(
              visible: completedTimeSheets.isNotEmpty,
              child: Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Completed Records',
                          style: TypographyStyles.getBodySmall(),
                        )
                      ],
                    ),

                    const SizedBox(height: 8,),

                    Expanded(
                      child: ListView.builder(
                        itemBuilder: _getCompletedItemListTile,
                        itemCount: completedTimeSheets.length,
                      ),
                    ),
                  ],
                ),
              ),
            )

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
                      detailValue: mainItem.project.projectName,
                      leadingColor: mainItem.project.markerColor,
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
                        style: TypographyStyles.getBodyMedium(),
                      ),
                    ],
                  ),

                  Text(
                    openedTask.description,
                    style: TypographyStyles.getTitleSmall(),
                  )

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
                  dayOfWeek: getWeekDayFromDate(completedTimeSheets[index].dateCreated),
                  deadlineDate: completedTimeSheets[index].dateCreated,
                  startTime: openedTask.startTime
              ),
            ),
    
            //completion time rounded
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(64.0),
                color: Colors.white.withOpacity(.16),
              ),
              height: 32,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Center(
                child: Text(
                  completedTimeSheets[index].currentTime,
                  style: TypographyStyles.getLabelLarge(),
                ),
              ),
            )
          ]
        ),
    );
  }

  void onBackButtonPressed() {
    //route back to the home page;
    Navigator.pop(context);
  }
  
  void onMoreButtonPressed() {
    
  }

  void onStopButtonPressed() {
    setState(() {
      DataModel.timeSheetList[timerId].isCompleted = true;
      DataModel.timeSheetList[timerId].isActive = false;

      //update listView
      completedTimeSheets = DataModel.getCompletedTimeSheetsForTask(openedTask);

      //todo: maybe we don't need to reset descriptions when stopping the timer;
      //readMore = List.filled(DataModel.getAllTimeSheetsForTask(openedTask).length, false);

    });
  }

  void onPauseButtonPressed() {
    //todo: needs refactoring;

    //start/stop timer
    //stop timer if active
    if (DataModel.timeSheetList[timerId].timer.isActive) {
      DataModel.timeSheetList[timerId].timer.cancel();
    }
    else {
      //start a timer
      int minutes = int.parse(DataModel.timeSheetList[timerId].currentTime.substring(0, 2));
      int seconds = int.parse(DataModel.timeSheetList[timerId].currentTime.substring(3, 5));

      int startingPoint = minutes * 60 + seconds;

      DataModel.timeSheetList[timerId].timer = Timer.periodic(oneSecond, (Timer timer) {
        if (startingPoint == 0) {

          //the task is finished
          timer.cancel();

          setState(() {
            DataModel.timeSheetList[timerId].isCompleted = true;
          });

        }
        else {
          startingPoint--;

          minutes = startingPoint ~/ 60;
          seconds = startingPoint % 60;

          //update time
          setState(() {
            DataModel.timeSheetList[timerId].currentTime =
            '${minutes.toString().padLeft(2, "0")}'
                ':${seconds.toString().padLeft(2, "0")}';
          });
        }
      });

    }

    //update UI
    setState(() {
      DataModel.timeSheetList[timerId].isActive = !DataModel.timeSheetList[timerId].isActive;
    });
  }

  void onEditDescriptionButtonPressed() {

  }

  bool hasTextOverflow(
      String text,
      TextStyle style,
      double textScaleFactor,
      {double minWidth = 0,
        double maxWidth = double.infinity,
        int maxLines = 2
      }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: ui.TextDirection.ltr,
      textScaleFactor: textScaleFactor,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
  }

  String getWeekDayFromDate(String date)
  {
    List<String> array = date.split('.');

    if (array.length == 3)
    {
      debugPrint(array.first);

      var day = array.first;
      var month = array[1];
      var year = array[2];

      return DateFormat('EEEE').format(
        DateTime.parse('$year-$month-$day'),
      );
    }

    return '';
  }

}
