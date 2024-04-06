import 'package:apexive_senior_flutter_engineer_timers_test/ui/typography.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Timesheets'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Timesheets', style: TypographyStyles.headlineLarge,),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [

                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0x29ffffff)
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(Icons.sync_alt, color: Colors.white),
                            ),

                            const Padding(padding: EdgeInsets.only(right: 8)),

                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0x29ffffff)
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(Icons.add, color: Colors.white,),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //tab view
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: DefaultTabController(
                    length: 3,
                    child: TabBar(
                      indicatorColor: Colors.white,
                      tabs: [
                        Tab(text: 'Favorites',),
                        Tab(text: 'Odoo',),
                        Tab(text: 'Local',)
                      ],
                    )
                  ),
                ),

                //Text (number of timers)


                //listView

                //bottom navigation

              ],
            ),
          )
        ),
      ),
    );
  }

  void onAddTimerButtonPressed() {

  }

}
