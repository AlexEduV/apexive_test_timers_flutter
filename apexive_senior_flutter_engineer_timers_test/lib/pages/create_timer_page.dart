import 'package:apexive_senior_flutter_engineer_timers_test/style/typography.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/drop_down_selector.dart';
import 'package:flutter/material.dart';

import '../model/task.dart';

class CreateTimerPage extends StatefulWidget {
  const CreateTimerPage({super.key});

  static const routeName = '/CreateTimerActivity';

  @override
  State<CreateTimerPage> createState() => _CreateTimerPageState();
}

class _CreateTimerPageState extends State<CreateTimerPage> {

  List<Task> tasks = [];

  List<String> projectNames = [];
  List<DropdownMenuItem<String>> projectMenuItems = [];

  String? _selectedProjectNameValue;

  @override
  void initState() {
    super.initState();

    //get data using async
    Future.delayed(Duration.zero, ()
    {
      //get data from route
      tasks = ModalRoute.of(context)?.settings.arguments as List<Task>;

      //get distinct project names from task list
      for (final task in tasks) {
        projectNames.add(task.project.projectName);
      }

      projectNames = projectNames.toSet().toList();

      //populate the menu list
      for (final projectName in projectNames)
      {
        projectMenuItems.add(
            DropdownMenuItem<String>(
              value: projectName,
              child: Text(projectName),
            ),);
      }

      setState(() {
        //init text value is set to the first of the list
        //_selectedProjectNameValue = projectMenuItems[0].value!;
      });

    });
  }

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
                    //alignment: Alignment.center,
                    children: [
                      //back button
                      IconButton(
                          onPressed: onBackButtonPressed,
                          icon: const Icon(Icons.arrow_back_ios, size: 30, color: Colors.white,),),

                      //title in the center
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Create Timer', style: TypographyStyles().getHeadlineSmall(),),
                        ],
                      ),
                    ],
                  ),
                ),

                const Padding(padding: EdgeInsets.only(top: 16)),

                //project selector
                DropDownSelector(
                  menuItems: projectMenuItems,
                  selectedValue: _selectedProjectNameValue,
                  hintText: 'Project',
                ),

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
