import 'package:apexive_senior_flutter_engineer_timers_test/pages/create_timer_page.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/pages/my_home_page.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/pages/task_details_page.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/style/typography.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odoo',
      theme: ThemeData(
        tabBarTheme: TabBarTheme(
          dividerColor: Colors.white.withOpacity(.16),
          labelStyle: TypographyStyles.getLabelLarge(),
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          //this property is needed to prevent tab label clipping:
          labelPadding: const EdgeInsets.symmetric(horizontal: 0.0),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TypographyStyles.getBottomNavigationNormal(),
          unselectedLabelStyle: TypographyStyles.getBottomNavigationNormal(),
        ),
        //typography:

      ),
      home: const MyHomePage(title: 'Timesheets'),
      routes: {
        CreateTimerPage.routeName: (context) => const CreateTimerPage(),
        TaskDetailsPage.routeName: (context) => const TaskDetailsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
