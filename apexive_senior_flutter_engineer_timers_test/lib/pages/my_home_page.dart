
import 'dart:async';

import 'package:apexive_senior_flutter_engineer_timers_test/model/data_model.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/pages/create_timer_page.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/pages/task_details_page.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/appBar/app_bar_button.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/custom_card.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/timersList/timer_specs_row.dart';
import 'package:flutter/material.dart';

import '../model/task.dart';
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
  List<Task> listOfTasks = [];
  int listSize = 0;

  int listNotCompletedCount = 0;

  //time constants
  static const oneSecond = Duration(seconds: 1);

  @override
  void initState() {
    super.initState();

    //testing
    //init one test task
    listOfTasks = DataModel.getInitTestTasks();
    listSize = listOfTasks.length;

    listNotCompletedCount = DataModel.getNotCompletedTasksCount();

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

                  //app bar
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
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
                                visible: listNotCompletedCount > 0,
                                child: AppBarButton(
                                  iconSource: 'assets/images/sort.png',
                                  onTap: onSortListButtonPressed,
                                ),
                              ),

                              AppBarButton(
                                iconSource: 'assets/images/plus-2.png',
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
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      border: BorderDirectional(
                        bottom: BorderSide(
                          width: 1.0,
                          color: Colors.white.withOpacity(.16),
                        ),),
                    ),
                    child: DefaultTabController(
                        initialIndex: 1,
                        length: 3,
                        child: TabBar(
                          onTap: (int index) {
                            setState(() {
                              selectedTabPageIndex = index;
                            });
                          },
                          labelStyle: TypographyStyles.getLabelLarge(),
                          indicatorColor: Colors.white,
                          indicatorSize: TabBarIndicatorSize.label,
                          unselectedLabelColor: Colors.white,
                          //isScrollable: true,
                          tabs: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Tab(text: 'Favorites',),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 32.0),
                              child: const Tab(text: 'Odoo',),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Tab(text: 'Local',),
                            ),
                          ],
                        ),
                    ),
                  ),

                  //Tab Page
                  Expanded(child: getTabPage(selectedTabPageIndex),),

                  //bottom navigation
                  _getBottomNavigationBar(),
                ],
              ),
            )
        ),
      ),
    );
  }

  void onAddTimerButtonPressed() {

    //open createTimerPage
    Navigator.pushNamed(context, CreateTimerPage.routeName).then((value) => updateTimersList());
  }

  void onSortListButtonPressed() {

  }
  
  void updateTimersList() {
    setState(() {
      listOfTasks = DataModel.taskList;
      listSize = listOfTasks.length;
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
                  'You have $listNotCompletedCount Timers',
                  style: TypographyStyles.getLabelLarge(),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),

          const Padding(padding: EdgeInsets.only(top: 16)),

          //listView
          Expanded(
            child: ListView.separated(
                itemBuilder: _getTimersListTile,
                itemCount: listSize,
                separatorBuilder:(context, index) {
                  return const Divider(
                    //empty invisible divider
                    height: 0, thickness: 0, color: Colors.transparent,);
                 },
            ),
          )

        ],
      );
    }

    return selectedTabPage;
  }

  Widget _getTimersListTile(BuildContext context, int index) {

    //hide the task if completed
    if (listOfTasks[index].isCompleted){
      return Container();
    }

    return GestureDetector(
      onTap: () => onListItemTapped(index),
      child: CustomCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            //column with timer specs and border
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 2,
                      color: listOfTasks[index].project.markerColor,
                    )
                  )
                ),
                padding: const EdgeInsets.only(left: 8),
                child: Wrap(
                  runSpacing: 4,
                  children: [

                    //timer name
                    TimerSpecsRow(
                      text: listOfTasks[index].title,
                      textStyle: TypographyStyles.getTitleMedium(),
                      icon: listOfTasks[index].isFavorite ? Icons.star : Icons.star_border,
                      iconSource: '',
                    ),

                    //timer project
                    TimerSpecsRow(
                        text: listOfTasks[index].project.projectName,
                        textStyle: TypographyStyles.getBodyMedium(),
                        iconSource: 'assets/images/case.png'),

                    //deadline
                    TimerSpecsRow(
                        text: 'Deadline ${listOfTasks[index].deadlineDate}',
                        textStyle: TypographyStyles.getBodyMedium(),
                        iconSource: 'assets/images/timer.png'),

                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: () => onPauseButtonPressed(index),
              child: Container(
                width: 104,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(64),
                  color: listOfTasks[index].isActive ? Colors.white : Colors.white.withOpacity(.08),
                ),
                padding: const EdgeInsets.only(left: 16, top: 8, right: 8, bottom: 8),
                child: Wrap(
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [

                    //time
                    Text(listOfTasks[index].currentTime, style: TypographyStyles.getLabelLarge(specifiedColor: listOfTasks[index].isActive ? Colors.black : Colors.white),),

                    //pause icon
                    Image.asset(listOfTasks[index].isActive ?
                    'assets/images/pause-1.png' :
                    'assets/images/play_arrow_solid.png',
                    color: listOfTasks[index].isActive ? Colors.black : Colors.white,
                    height: 32,
                    width: 32,
                    ),
                  ],
                ),

              ),
            )
          ],

        ),
      ),
    );
  }

  Widget _getBottomNavigationBar()
  {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.access_time_filled_sharp),
          icon: Icon(Icons.access_time_rounded),

          label: 'Timesheets',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.cases_sharp),
          icon: Icon(Icons.cases_outlined),

          label: 'Projects',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.settings_sharp),
          icon: Icon(Icons.settings_outlined),
          label: 'Settings',
        ),
      ],
      currentIndex: selectedBottomNavigationIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: TypographyStyles.getBottomNavigationNormal(),
      unselectedLabelStyle: TypographyStyles.getBottomNavigationNormal(),
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
        arguments: index                 //share id of task
    ).then((value) => updateTimersList());
  }

  void onPauseButtonPressed(int index)
  {
    //start/stop timer
    //stop timer if active
    if (listOfTasks[index].timer.isActive) {
      listOfTasks[index].timer.cancel();
    }
    else {
      //start a timer
      int minutes = int.parse(listOfTasks[index].currentTime.substring(0, 2));
      int seconds = int.parse(listOfTasks[index].currentTime.substring(3, 5));

      int startingPoint = minutes * 60 + seconds;

      listOfTasks[index].timer = Timer.periodic(oneSecond, (Timer timer) {
        if (startingPoint == 0) {

          //the task is finished
          timer.cancel();

          setState(() {
            listOfTasks[index].isCompleted = true;
            listNotCompletedCount--;
          });

        }
        else {
          startingPoint--;

          minutes = startingPoint ~/ 60;
          seconds = startingPoint % 60;

          //update time
          setState(() {
            listOfTasks[index].currentTime =
            '${minutes.toString().padLeft(2, "0")}'
            ':${seconds.toString().padLeft(2, "0")}';
          });
        }
      });

    }

    //update UI
    setState(() {
      listOfTasks[index].isActive = !listOfTasks[index].isActive;
    });
  }
}
