
import 'package:apexive_senior_flutter_engineer_timers_test/model/data_model.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/custom_app_bar.dart';
import 'package:apexive_senior_flutter_engineer_timers_test/ui/round_button.dart';
import 'package:flutter/material.dart';

import '../model/task.dart';
import '../style/typography.dart';

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({super.key});

  static const routeName = '/TaskDetailsActivity';

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {

  int selectedTabPageIndex = 0;

  late Task openedTask;
  int taskId = 0;

  //for every timer in the task set init readMore to 'false'
  List<bool> readMore = [false];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {

      //get task id from the route arguments;
      taskId = ModalRoute.of(context)?.settings.arguments as int;

      //set current task
      setState(() {
        openedTask = DataModel.taskList[taskId];
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
            child: Column(
              children: [

                //app bar - user's name & edit button
                CustomAppBar(
                  onBackButtonPressed: onBackButtonPressed,
                  title: '${openedTask.title} - ${openedTask.assignedTo}',
                  titleTextStyle: TypographyStyles.getTitleMedium(),
                  actions: [
                    IconButton(
                      onPressed: onMoreButtonPressed,
                      icon: Image.asset(
                        'assets/images/pencil.png',
                        height: 24,
                        width: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                //tab bar - timesheets & details
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    border: BorderDirectional(
                      bottom: BorderSide(
                        width: 1.0,
                        color: Colors.white.withOpacity(.16),
                      ),),
                  ),
                  child: DefaultTabController(
                    initialIndex: 0,
                    length: 2,
                    child: TabBar(
                      onTap: (int index) {
                        setState(() {
                          selectedTabPageIndex = index;
                        });
                      },
                      labelStyle: TypographyStyles.getLabelLarge(),
                      indicatorColor: Colors.white,
                      tabs: const [
                        Tab(text: 'Timesheets',),
                        Tab(text: 'Details',),
                      ],
                    ),
                  ),
                ),
                  
                //selected tab view
                Expanded(child: getTabPage(selectedTabPageIndex),),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getTabPage(int selectedIndex) {

    //timesheets view
    if (selectedIndex == 0) {

      return Column(
        children: [

          //task detail view
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(.08),
            ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 8, top: 16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Wrap(
                  direction: Axis.vertical,
                  spacing: 4,

                  children: [
                    Text(
                      'Monday',
                      style: TypographyStyles.getBodySmall(),
                    ),

                    Text(
                      openedTask.deadlineDate,
                      style: TypographyStyles.getTitleMedium(),
                    ),

                    Text(
                      'Start Time ${openedTask.startTime}',
                      style: TypographyStyles.getBodySmall(),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      //time text
                      Text(
                        openedTask.currentTime,
                        style: TypographyStyles.getDisplaySmall(),
                      ),

                      //control buttons
                      Wrap(
                        spacing: 16,
                        children: [

                          //stop button
                          RoundButton(
                            backgroundColor: Colors.white.withOpacity(.16),
                            tintColor: Colors.white,
                            iconSource: 'assets/images/stop_fill.png',
                            onButtonPressed: onStopButtonPressed
                          ),

                          //pause button
                          RoundButton(
                            backgroundColor: openedTask.isActive
                                ? Colors.white : Colors.white.withOpacity(.16),
                            tintColor: openedTask.isActive
                                ? Colors.black : Colors.white,
                            iconSource: openedTask.isActive
                                ? 'assets/images/pause-1.png'
                                : 'assets/images/play_arrow_solid.png',
                            onButtonPressed: onPauseButtonPressed,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //Description section
                Divider(height: 1, color: Colors.white.withOpacity(.16),),

                const SizedBox(height: 16.0,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Description',
                          style: TypographyStyles.getBodySmall(),
                        ),

                        IconButton(
                          onPressed: onEditDescriptionButtonPressed,
                          icon: Image.asset(
                            'assets/images/pencil.png',
                            height: 24,
                            width: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4,),

                    Text(
                      openedTask.description,
                      style: TypographyStyles.getBodyMedium(),
                      maxLines: readMore[0] ? 10 : 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4,),

                    Visibility(
                      visible: !readMore[0],
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            readMore[0] = !readMore[0];
                          });
                        },
                        child: Text(
                          'Read More',
                          style: TypographyStyles.getBodySmall(),
                        ),
                      ),
                    ),

                   ]
                ),



              ],
            ),
          ),

          //completed records listview
          //description & edit button


        ],
      );

    }
    //details view
    else if (selectedIndex == 1) {

      //project overview

        //project details
        //project description
    }

    //if unknown index
    return Container();
  }

  void onBackButtonPressed() {
    //route back to the home page;
    Navigator.pop(context);
  }
  
  void onMoreButtonPressed() {
    
  }

  void onStopButtonPressed() {
    setState(() {
      openedTask.isCompleted = true;
      openedTask.isActive = false;
    });
  }

  void onPauseButtonPressed() {
    setState(() {
      openedTask.isActive = !openedTask.isActive;
    });
  }

  void onEditDescriptionButtonPressed() {

  }

}
