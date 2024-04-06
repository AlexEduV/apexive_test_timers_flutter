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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      //extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   title: Text(widget.title),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   titleSpacing: 24,
      //
      //   actions: [
      //     Container(
      //       margin: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
      //       child: Center(
      //         child: Ink(
      //           //height: 48,
      //           padding: EdgeInsets.all(8),
      //           //width: 48,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(15),
      //             color: const Color(0x29ffffff),
      //           ),
      //           child: IconButton(
      //             onPressed: onAddTimerButtonPressed,
      //             icon: const Icon(Icons.add, size: 24, color: Colors.white,),
      //             //color: const Color(0x29ffffff),
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Timesheets', style: TypographyStyles.headlineLarge,),

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
                              padding: EdgeInsets.all(8.0),
                              child: const Icon(Icons.sync_alt, color: Colors.white),
                            ),

                            Padding(padding: EdgeInsets.only(right: 8)),

                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0x29ffffff)
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: const Icon(Icons.add, color: Colors.white,),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }

  void onAddTimerButtonPressed() {

  }
}