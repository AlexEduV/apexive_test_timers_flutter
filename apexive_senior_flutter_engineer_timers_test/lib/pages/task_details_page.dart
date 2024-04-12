
import 'package:apexive_senior_flutter_engineer_timers_test/model/data_model.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/time_sheet_item.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/appBar/custom_app_bar.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/buttons/round_button.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/taskDetailsView/detail_row.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/taskDetailsView/timesheet_specs_column.dart';
import 'package:flutter/material.dart';

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

  int selectedTabPageIndex = 0;

  int timerId = 0;
  TimeSheetItem? mainItem;
  Task? openedTask;

  List<TimeSheetItem> timeSheets = [];

  List<bool> readMore = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {

      //get task id from the route arguments;
      timerId = ModalRoute.of(context)?.settings.arguments as int;

      //set current task
      setState(() {
        mainItem = DataModel.timeSheetList[timerId];
        openedTask = mainItem?.task;

        timeSheets = DataModel.getAllTimeSheetsForTask(openedTask!);
      });

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
                  title: '${openedTask?.title} - ${openedTask?.assignedTo}',
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

      return Column(
        children: [

          //task detail view
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: CustomCard(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  TimesheetSpecsColumn(
                      dayOfWeek: 'Monday',
                      deadlineDate: openedTask?.deadlineDate ?? '',
                      startTime: openedTask?.startTime ?? ''
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        //time text
                        Text(
                          mainItem?.currentTime ?? '',
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
                              backgroundColor: mainItem?.isActive ?? false
                                  ? Colors.white : Colors.white.withOpacity(.16),
                              tintColor: mainItem?.isActive ?? false
                                  ? Colors.black : Colors.white,
                              iconSource: mainItem?.isActive ?? false
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
                        openedTask?.description ?? '',
                        style: TypographyStyles.getBodyMedium(),
                        maxLines: readMore[0] ? 10 : 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 4,),

                      Visibility(
                        visible: !readMore[0] && hasTextOverflow(
                          openedTask?.description ?? '',
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

          //completed records listview
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
              itemBuilder: _getCompletedListTile,
              itemCount: 2,
            ),
          )

          //description & edit button


        ],
      );

    }
    //details view
    else if (selectedIndex == 1) {

      //task overview
      return Column(
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
                    detailValue: mainItem?.project.projectName ?? '',
                    leadingColor: mainItem?.project.markerColor,
                  ),

                  //Deadline
                  DetailRow(
                    detailTitle: 'Deadline',
                    detailValue: openedTask?.deadlineDate ?? '',
                  ),

                  //Assign To
                  DetailRow(
                    detailTitle: 'Assigned to',
                    detailValue: openedTask?.assignedTo ?? '',
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
                  openedTask?.description ?? '',
                  style: TypographyStyles.getTitleSmall(),
                )

              ],
            ),
          ),

        ],
      );
    }

    //if unknown index
    return Container();
  }

  Widget _getCompletedListTile(BuildContext context, int index)
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
                  dayOfWeek: 'Monday',
                  deadlineDate: openedTask?.deadlineDate ?? '',
                  startTime: openedTask?.startTime ?? ''
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
                  '08:00',
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
      mainItem?.isCompleted = true;
      mainItem?.isActive = false;
    });
  }

  void onPauseButtonPressed() {
    setState(() {
      if (mainItem != null) {
        mainItem?.isActive = !mainItem!.isActive;
      }
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
      textDirection: TextDirection.ltr,
      textScaleFactor: textScaleFactor,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
  }

}
