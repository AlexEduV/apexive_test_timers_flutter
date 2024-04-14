import 'dart:async';

import 'package:apexive_senior_flutter_engineer_timers_test/model/data_model.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/model/time_sheet_item.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/style/typography.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/buttons/splash_button.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/check_box_labeled.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/appBar/custom_app_bar.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/custom_page_background.dart';
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

  List<String> projectNames = [];
  List<DropdownMenuEntry<String>> projectMenuItems = [];

  List<String> taskNames = [];
  List<DropdownMenuEntry<String>> taskMenuItems = [];

  String? _selectedProjectNameValue;
  String? _selectedTaskNameValue;

  TextEditingController descriptionTextController = TextEditingController();

  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    //get distinct project names from task list
    for (final timesheet in DataModel.timeSheetList) {
      projectNames.add(timesheet.project.projectName);
      taskNames.add(timesheet.task.title);
    }

    projectNames = projectNames.toSet().toList();
    taskNames = taskNames.toSet().toList();

    //populate the menu list
    for (final projectName in projectNames)
    {
      projectMenuItems.add(
          DropdownMenuEntry<String>(
            value: projectName,
            label: projectName,
            style: MenuItemButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: TypographyStyles.getBodyLarge(),
            ),
          ),
      );
    }

    for (final taskName in taskNames)
    {
      taskMenuItems.add(
        DropdownMenuEntry<String>(
          value: taskName,
          label: taskName,
          style: MenuItemButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: TypographyStyles.getBodyLarge(),
          ),
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

        child: CustomPageBackground(

          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),

            child: Column(
              children: [

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          runSpacing: 16,
                          children: [

                            //app bar
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
                              onSelected: (String? selectedValue) {
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
                              onSelected: (String? selectedValue) {
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
                      ],
                    ),
                  ),
                ),

                //create timer active button
                SplashButton(
                  onTap: onCreateTimerButtonPressed,
                  title: 'Create Timer',
                ),

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

      //add a new timer to the task list with specified parameters
      DataModel.timeSheetList.add(
        TimeSheetItem(
          description: descriptionTextController.text,
          project: selectedProject,
          task: selectedTask,
          dateCreated: '12.04.2024',
          dateCompleted: '',
          currentTime: selectedTask.startTime,
          isActive: false,
          isCompleted: false,
          isFavorite: isFavorite,
          timer: Timer(Duration.zero, (){}),
        )
      );

      //go forward to the list page
      Navigator.pop(context);
    }

  }
}
