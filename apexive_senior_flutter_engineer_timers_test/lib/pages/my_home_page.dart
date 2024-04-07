
import 'package:apexive_senior_flutter_engineer_timers_test/pages/create_timer_page.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/app_bar_button.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/timersList/timer_settings_row.dart';
import 'package:flutter/material.dart';

import '../style/typography.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedTabPageIndex = 1;
  int selectedBottomNavigationIndex = 0;

  @override
  void initState() {
    super.initState();


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

                  //Top row
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.title, style: TypographyStyles().getHeadlineLarge(),),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [

                              AppBarButton(icon: Icons.swap_vert_sharp, onTap: onSortListButtonPressed,),

                              const Padding(padding: EdgeInsets.only(right: 8)),

                              AppBarButton(icon: Icons.add, onTap: onAddTimerButtonPressed,),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  //tab view
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DefaultTabController(
                        initialIndex: 1,
                        length: 3,
                        child: TabBar(
                          onTap: (int index) {
                            setState(() {
                              selectedTabPageIndex = index;
                            });
                          },
                          labelStyle: TypographyStyles().getLabelLarge(),
                          indicatorColor: Colors.white,
                          tabs: const [
                            Tab(text: 'Favorites',),
                            Tab(text: 'Odoo',),
                            Tab(text: 'Local',)
                          ],
                        )
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
      //bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  void onAddTimerButtonPressed() {
    //debugPrint('AddTimerButtonPressed');

    //open createTimerPage
    Navigator.pushNamed(context, CreateTimerPage.routeName);
  }

  void onSortListButtonPressed() {

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
                  'You have 16 Timers',
                  style: TypographyStyles().getLabelLarge(),
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
                itemCount: 1,
                separatorBuilder:(context, index) {
                  return const Divider(
                    //empty invisible divider
                    height: 0, thickness: 0, color: Colors.white,);
                 },
            ),
          )

        ],
      );
    }

    return selectedTabPage;
  }

  Widget _getTimersListTile(BuildContext context, int index) {
    return Container(
      //decorated container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0x14ffffff)
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //column with timer specs and border
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 2,
                    color: Color(0xffFFC629),
                  )
                )
              ),
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //timer name
                  TimerSettingsRow(
                      text: 'iOS App Deployment with odd',
                      textStyle: TypographyStyles().getTitleMedium(),
                      icon: Icons.star_border),

                  //timer project
                  TimerSettingsRow(
                      text: 'SO056 - Booqio V2',
                      textStyle: TypographyStyles().getBodyMedium(),
                      icon: Icons.cases_outlined),

                  //deadline
                  TimerSettingsRow(
                      text: 'Deadline 07/20/2023',
                      textStyle: TypographyStyles().getBodyMedium(),
                      icon: Icons.access_time_rounded),

                ],
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(64),
              color: Colors.white
            ),
            //width: 104,
            //height: 48,
            padding: const EdgeInsets.only(left: 16, top: 8, right: 8, bottom: 8),
            child: Row(
              children: [
                //time
                Text('00:30', style: TypographyStyles().getLabelLarge(specifiedColor: Colors.black),),
                
                const Padding(padding: EdgeInsets.only(right: 4)),

                //pause icon
                const Icon(Icons.pause_rounded, color: Colors.black, size: 32,)
              ],
            ),

          )
        ],

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

          label: 'TimeSheets',
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
      onTap: onBottomNavigationItemTapped,
    );
  }

  void onBottomNavigationItemTapped(int index){
    setState(() {
      selectedBottomNavigationIndex = index;
    });
  }
}
