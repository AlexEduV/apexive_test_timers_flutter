
import 'package:apexive_senior_flutter_engineer_timers_test/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../style/typography.dart';

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({super.key});

  static const routeName = '/TaskDetailsActivity';

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {

  int selectedTabPageIndex = 0;

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
                  title: 'Getting to know Apexer - Ivan',
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
                      labelStyle: TypographyStyles.getLabelLarge(),
                      indicatorColor: Colors.white,
                      tabs: const [
                        Tab(text: 'Timesheets',),
                        Tab(text: 'Details',),
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

      //task detail view

      //completed records listview
      //description & edit button

    }
    //details view
    else if (selectedIndex == 1) {

      //project overview

        //project details
        //project description
    }

    //if unknown index
    return Container();
  }

  void onBackButtonPressed() {
    //route back to the home page;
    Navigator.pop(context);
  }
  
  void onMoreButtonPressed() {
    
  }

}
