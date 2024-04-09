import 'package:apexive_senior_flutter_engineer_timers_test/pages/create_timer_page.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/pages/my_home_page.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/pages/task_details_page.dart';
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
        // appBarTheme: AppBarTheme(
        //   toolbarHeight: 64,
        //   titleTextStyle: TextStyle(
        //     fontSize: 32,
        //     color: Colors.white,
        //     fontWeight: FontWeight.w700,
        //   )
        // ),
        //primarySwatch: Colors.blue,
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
