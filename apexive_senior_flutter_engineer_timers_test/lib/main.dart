import 'package:apexive_senior_flutter_engineer_timers_test/ui/my_app_bar.dart';
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
        appBarTheme: AppBarTheme(
          toolbarHeight: 64,
          titleTextStyle: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          )
        ),
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 24,
        actions: [
          Ink(
            height: 48,
            padding: EdgeInsets.all(8),
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0x29ffffff),
            ),
            child: IconButton(
              onPressed: onAddTimerButtonPressed,
              icon: const Icon(Icons.add, size: 24, color: Colors.white,),
              //color: const Color(0x29ffffff),
            ),
          )
        ],
      ),
      body: Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
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
