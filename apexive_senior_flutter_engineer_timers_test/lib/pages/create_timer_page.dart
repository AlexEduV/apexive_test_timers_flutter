import 'package:apexive_senior_flutter_engineer_timers_test/style/typography.dart';
import 'package:flutter/material.dart';

class CreateTimerPage extends StatefulWidget {
  const CreateTimerPage({super.key});

  static const routeName = '/CreateTimerActivity';

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
            padding: const EdgeInsets.only(right: 16, left: 16),
            //app bar
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Stack(
                    children: [
                      //back button
                      IconButton(
                          onPressed: onBackButtonPressed,
                          icon: const Icon(Icons.arrow_back_ios, size: 40, color: Colors.white,),),

                      //title in the center
                      Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Create Timer', style: TypographyStyles().getHeadlineSmall(),),
                            ],
                          ),
                      ),
                    ],
                  ),
                ),

                //project selector

                //task selector

                //Description TextEdit

                //make favorite selector

                const Spacer(),

                //create timer active button
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
    Navigator.pop(context);

  }
}
