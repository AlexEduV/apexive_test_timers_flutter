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

  List<String> taskNames = [];
  List<DropdownMenuItem<String>> taskMenuItems = [];

  String? _selectedProjectNameValue;
  String? _selectedTaskNameValue;

  TextEditingController descriptionTextController = TextEditingController();

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
        taskNames.add(task.title);
      }

      projectNames = projectNames.toSet().toList();
      taskNames = taskNames.toSet().toList();

      //populate the menu list
      for (final projectName in projectNames)
      {
        projectMenuItems.add(
            DropdownMenuItem<String>(
              value: projectName,
              child: Text(projectName),
            ),);
      }

      for (final taskName in taskNames)
      {
        taskMenuItems.add(
          DropdownMenuItem<String>(
            value: taskName,
            child: Text(taskName),),
        );
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

                const Padding(padding: EdgeInsets.only(top: 16)),

                //task selector
                DropDownSelector(
                    menuItems: taskMenuItems,
                    selectedValue: _selectedTaskNameValue,
                    hintText: 'Task',
                ),

                const Padding(padding: EdgeInsets.only(top: 16)),

                //Description TextEdit
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: const Color(0x29ffffff),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      //hoverColor: Colors.transparent,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      hintStyle: TypographyStyles().getBodyLarge(),
                      hintText: 'Description',
                      counterText: "",),
                    //cursorColor: Colors.transparent,
                    enabled: true,
                    maxLength: 20,
                    textInputAction: TextInputAction.next,
                    controller: descriptionTextController,

                  ),
                ),

                //make favorite selector

                const Spacer(),

                //create timer active button
              ],
            ),
          ),

        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  void onBackButtonPressed()
  {
    //route back to the home page;
    Navigator.pop(context);

  }
}
