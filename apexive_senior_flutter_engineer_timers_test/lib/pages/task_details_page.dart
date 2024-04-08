
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
                ),

                //tab bar - timesheets & details

                  //task detail view

                    //completed records listview
                    //description onTap

                  //project overview

                    //project details
                    //project description

              ],
            ),
          ),
        ),
      ),
    );
  }

  void onBackButtonPressed() {
    //route back to the home page;
    Navigator.pop(context);
  }

}
