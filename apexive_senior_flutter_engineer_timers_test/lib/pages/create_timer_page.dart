import 'package:flutter/material.dart';

class CreateTimerPage extends StatefulWidget {
  const CreateTimerPage({super.key, required this.title});

  final String title;

  @override
  State<CreateTimerPage> createState() => _CreateTimerPageState();
}

class _CreateTimerPageState extends State<CreateTimerPage> {

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
            padding: EdgeInsets.only(right: 16, left: 16),
            //app bar
            child: Row(
              children: [
                //back button
                IconButton(
                    onPressed: onBackButtonPressed,
                    icon: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Icon(Icons.arrow_back_ios, size: 48,),
                    ))

                //title in the center

              ],
            ),
          ),

        ),
      ),
    );
  }

  void onBackButtonPressed()
  {
    //route back to the home page;

  }
}
