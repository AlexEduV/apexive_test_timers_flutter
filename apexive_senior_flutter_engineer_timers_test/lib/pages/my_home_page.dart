
import 'dart:async';

import 'package:apexive_senior_flutter_engineer_timers_test/model/data_model.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/time_sheet_item.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/pages/create_timer_page.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/pages/task_details_page.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/appBar/app_bar_button.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/custom_card.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/timersList/timer_specs_row.dart';
import 'package:flutter/material.dart';

import '../style/typography.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //UI init
  int selectedTabPageIndex = 1;
  int selectedBottomNavigationIndex = 0;

  //persistence init
  List<TimeSheetItem> listOfTimers = [];
  int listSize = 0;

  int timersCount = 0;

  //time constants
  static const oneSecond = Duration(seconds: 1);

  @override
  void initState() {
    super.initState();

    //init test tasks
    //todo: only for testing
    listOfTimers = DataModel.getInitTestTimeSheets();

    //show only not completed timers
    listSize = listOfTimers.length;

    //show all timers count
    timersCount = listOfTimers.length;

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
            child: Column(
              children: [

                //app bar
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      //title
                      Text(widget.title, style: TypographyStyles.getHeadlineLarge(),),

                      //buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 8,
                          children: [
                            Visibility(
                              visible: timersCount > 0,
                              child: AppBarButton(
                                iconSource: 'assets/images/sort.png',
                                onTap: onSortListButtonPressed,
                              ),
                            ),

                            AppBarButton(
                              iconSource: 'assets/images/plus.png',
                              onTap: onAddTimerButtonPressed,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //tab view
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: DefaultTabController(
                      initialIndex: 1,
                      length: 3,
                      child: TabBar(
                        onTap: (int index) {
                          setState(() {
                            selectedTabPageIndex = index;
                          });
                        },
                        tabs: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Tab(text: 'Favorites',),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 16.0),
                            child: Tab(text: 'Odoo',),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Tab(text: 'Local',),
                          ),
                        ],
                      ),
                  ),
                ),

                //Tab Page
                Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: getTabPage(selectedTabPageIndex),
                ),),

                //bottom navigation
                _getBottomNavigationBar(),
              ],
            )
        ),
      ),
    );
  }

  void onAddTimerButtonPressed() {

    //open createTimerPage
    Navigator.pushNamed(context, CreateTimerPage.routeName)
        .then((value) => updateTimersList()
    );
  }

  void onSortListButtonPressed() {

  }

  void updateTimersList() {
    setState(() {

      listOfTimers = DataModel.timeSheetList;
      listSize = listOfTimers.length;

      timersCount = listOfTimers.length;
    });
  }

  Widget getTabPage(int selectedIndex)
  {
    Widget selectedTabPage = Container();

    //Odoo Tab
    if (selectedIndex == 1)
    {
      selectedTabPage = Column(
        children: [

          //Text (number of timers)
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'You have $timersCount Timers',
                  style: TypographyStyles.getLabelLarge(),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),

          const Padding(padding: EdgeInsets.only(top: 16)),

          //listView
          Expanded(
            child: ListView.builder(
                itemBuilder: _getTimersListTile,
                itemCount: listSize,
            ),
          )

        ],
      );
    }

    return selectedTabPage;
  }

  Widget _getTimersListTile(BuildContext context, int index) {

    //hide the task if completed
    if (listOfTimers[index].isCompleted) {
      return Container();
    }

    return GestureDetector(
      onTap: () => onListItemTapped(index),
      child: CustomCard(
        child: IntrinsicHeight(
          child: Row(
            children: [

              // leading line with project color
              Container(
                width: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: listOfTimers[index].project.markerColor,
                ),
                margin: const EdgeInsets.only(right: 8.0),
              ),

              //column with timer specs
              Expanded(
                child: Wrap(
                  runSpacing: 4,
                  children: [

                    //timer name
                    TimerSpecsRow(
                      text: listOfTimers[index].task.title,
                      textStyle: TypographyStyles.getTitleMedium(),
                      icon: listOfTimers[index].isFavorite ? Icons.star : Icons.star_border,
                      iconSource: '',
                    ),

                    //timer project
                    TimerSpecsRow(
                        text: listOfTimers[index].project.projectName,
                        textStyle: TypographyStyles.getBodyMedium(),
                        iconSource: 'assets/images/case.png'),

                    //deadline
                    TimerSpecsRow(
                        text: 'Deadline ${listOfTimers[index].task.deadlineDate}',
                        textStyle: TypographyStyles.getBodyMedium(),
                        iconSource: 'assets/images/timer.png'),

                  ],
                ),
              ),

              GestureDetector(
                onTap: () => onPauseButtonPressed(index),
                child: Container(
                  width: 104,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(64),
                    color: listOfTimers[index].isActive ? Colors.white : Colors.white.withOpacity(.08),
                  ),
                  padding: const EdgeInsets.only(left: 16, top: 8, right: 8, bottom: 8),
                  child: Center(
                    child: Wrap(
                      spacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [

                        //time
                        Text(listOfTimers[index].currentTime, style: TypographyStyles.getLabelLarge(specifiedColor: listOfTimers[index].isActive ? Colors.black : Colors.white),),

                        //pause icon
                        Image.asset(listOfTimers[index].isActive ?
                        'assets/images/pause.png' :
                        'assets/images/play_arrow_solid.png',
                        color: listOfTimers[index].isActive ? Colors.black : Colors.white,
                        height: 24,
                        width: 24,
                        ),
                      ],
                    ),
                  ),

                ),
              )
            ],

          ),
        ),
      ),
    );
  }

  Widget _getBottomNavigationBar()
  {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          activeIcon: Image.asset('assets/images/timer_fill.png', height: 24, width: 24,),
          icon: Image.asset('assets/images/timer.png', height: 24, width: 24,),
          label: 'Timesheets',
        ),
        BottomNavigationBarItem(
          activeIcon: Image.asset('assets/images/case_fill.png', height: 24, width: 24,),
          icon: Image.asset('assets/images/case.png', height: 24, width: 24,),
          label: 'Projects',
        ),
        BottomNavigationBarItem(
          activeIcon: Image.asset('assets/images/settings_fill.png', height: 24, width: 24,),
          icon: Image.asset('assets/images/settings.png', height: 24, width: 24,),
          label: 'Settings',
        ),
      ],
      currentIndex: selectedBottomNavigationIndex,
      onTap: onBottomNavigationItemTapped,
    );
  }

  void onBottomNavigationItemTapped(int index) {
    setState(() {
      selectedBottomNavigationIndex = index;
    });
  }

  void onListItemTapped(int index) {
    //debugPrint('listItemPressed');

    //open taskDetails page
    Navigator.pushNamed(
        context,
        TaskDetailsPage.routeName,
        arguments: index                 //share id of timesheet
    ).then((value) => updateTimersList());
  }

  void onPauseButtonPressed(int index)
  {
    //start/stop timer
    //stop timer if active
    if (listOfTimers[index].timer.isActive) {
      listOfTimers[index].timer.cancel();
    }
    else {
      //start a timer
      int minutes = int.parse(listOfTimers[index].currentTime.substring(0, 2));
      int seconds = int.parse(listOfTimers[index].currentTime.substring(3, 5));

      int startingPoint = minutes * 60 + seconds;

      listOfTimers[index].timer = Timer.periodic(oneSecond, (Timer timer) {
        if (startingPoint == 0) {

          //the task is finished
          timer.cancel();

          setState(() {
            listOfTimers[index].isCompleted = true;
          });

        }
        else {
          startingPoint--;

          minutes = startingPoint ~/ 60;
          seconds = startingPoint % 60;

          //update time
          setState(() {
            listOfTimers[index].currentTime =
            '${minutes.toString().padLeft(2, "0")}'
            ':${seconds.toString().padLeft(2, "0")}';
          });
        }
      });

    }

    //update UI
    setState(() {
      listOfTimers[index].isActive = !listOfTimers[index].isActive;
    });
  }
}
