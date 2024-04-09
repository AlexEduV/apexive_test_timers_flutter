import 'dart:async';

import 'package:apexive_senior_flutter_engineer_timers_test/model/data_model.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/style/typography.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/check_box_labeled.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/custom_app_bar.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/custom_text_field.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/drop_down_selector.dart';
import 'package:flutter/material.dart';

import '../model/project.dart';
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

  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    //get data from route
    tasks = DataModel.taskList;

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
          ),
      );
    }

    for (final taskName in taskNames)
    {
      taskMenuItems.add(
        DropdownMenuItem<String>(
          value: taskName,
          child: Text(taskName),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      extendBodyBehindAppBar: true,
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
                Wrap(
                  runSpacing: 16,
                  children: [

                    CustomAppBar(
                      onBackButtonPressed: onBackButtonPressed,
                      title: 'Create Timer',
                      titleTextStyle: TypographyStyles.getHeadlineSmall(),
                      actions: null,
                    ),

                    //project selector
                    DropDownSelector(
                      menuItems: projectMenuItems,
                      selectedValue: _selectedProjectNameValue,
                      hintText: 'Project',
                      onChanged: (String? selectedValue) {
                        if (selectedValue is String) {
                          setState(() {
                            _selectedProjectNameValue = selectedValue;
                          });
                        }
                      },
                    ),

                    //task selector
                    DropDownSelector(
                      menuItems: taskMenuItems,
                      selectedValue: _selectedTaskNameValue,
                      hintText: 'Task',
                      onChanged: (String? selectedValue) {
                        if (selectedValue is String) {
                          setState(() {
                            _selectedTaskNameValue = selectedValue;
                          });
                        }
                      },
                    ),

                    //Description TextEdit
                    CustomTextField(
                      textEditingController: descriptionTextController,
                      hintText: 'Description',
                    ),

                    //isFavorite checkBox
                    CheckBoxLabeled(
                      isFavorite: isFavorite,
                      label: 'Make Favorite',
                      onChanged: (bool? value) {
                        setState(() {
                          isFavorite = value!;
                        });
                      },
                    ),
                  ],
                ),

                const Spacer(),

                //create timer active button
                GestureDetector(
                  onTap: onCreateTimerButtonPressed,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    margin: const EdgeInsets.only(bottom: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.16),
                        borderRadius: BorderRadius.circular(12.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create Timer',
                          style: TypographyStyles.getLabelLarge(),
                        )
                      ],
                    ),
                  ),
                )
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

  void onCreateTimerButtonPressed()
  {
    debugPrint('create timer button pressed');

    //check user inputs
    if (_selectedProjectNameValue != null
        && _selectedTaskNameValue != null
        && descriptionTextController.text.isNotEmpty
    )
    {

      debugPrint('input check passed');

      //get data based on the inputs
      Project? selectedProject = DataModel.getProjectByName(_selectedProjectNameValue!);
      Task selectedTask = DataModel.getTaskByName(_selectedTaskNameValue!);

      //add a new task to the list with specified parameters
      DataModel.taskList.add(
          Task(
            title: selectedTask.title,
            description: descriptionTextController.text,
            project: selectedProject,
            assignedTo: selectedTask.assignedTo,
            deadlineDate: selectedTask.deadlineDate,
            startTime: selectedTask.startTime,
            currentTime: selectedTask.currentTime,
            isFavorite: isFavorite,
            isActive: false,
            isCompleted: false,
            timer: Timer(Duration.zero, (){}),
          )
      );

      //go forward to the list page
      Navigator.pop(context);
    }

  }
}
