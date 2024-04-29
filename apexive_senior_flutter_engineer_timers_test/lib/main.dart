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
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.w600,
            height: 44.0 / 36.0,
            fontFamily: 'Inter',
            color: Colors.white,
          ),
          headlineLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w700,
            height: 40.0 / 32.0,
            fontFamily: 'Inter',
            color: Colors.white,
          ),
          headlineSmall: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            height: 32.0 / 24.0,
            fontFamily: 'Inter',
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            height: 24.0 / 16.0,
            fontFamily: 'Inter',
            letterSpacing: 0.15,
            color: Colors.white,
          ),
          titleSmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            height: 20.0 / 14.0,
            fontFamily: 'Inter',
            letterSpacing: 0.1,
            color: Colors.white,
          ),
          labelLarge: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            height: 20.0 / 14.0,
            fontFamily: 'Inter',
            letterSpacing: 0.1,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            height: 24.0 / 16.0,
            fontFamily: 'Inter',
            letterSpacing: 0.15,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            height: 20.0 / 14.0,
            fontFamily: 'Inter',
            letterSpacing: 0.25,
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            height: 16.0 / 12.0,
            fontFamily: 'Inter',
            letterSpacing: 0.4,
            color: Colors.white,
          ),
        ),

        tabBarTheme: TabBarTheme(
          dividerColor: Colors.white.withOpacity(0.16),
          labelStyle: Theme.of(context).textTheme.labelLarge,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white,
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          //this property is needed to prevent tab label clipping:
          labelPadding: const EdgeInsets.symmetric(horizontal: 0.0),
        ),

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedIconTheme: IconThemeData(
            color: Colors.white,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                height: 12.0 / 10.0,
                                fontFamily: 'SF Pro',
                              ),
          unselectedLabelStyle: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  height: 12.0 / 10.0,
                                  fontFamily: 'SF Pro',
                                ),
        ),

      ),
      home: const MyHomePage(title: 'Timesheets'),
      routes: {
        CreateTimerPage.routeName: (_) => const CreateTimerPage(),
        TaskDetailsPage.routeName: (_) => const TaskDetailsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
