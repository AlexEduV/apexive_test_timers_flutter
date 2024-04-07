
import 'package:apexive_senior_flutter_engineer_timers_test/ui/app_bar_button.dart';
import 'package:flutter/material.dart';

import '../style/typography.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedTabPageIndex = 1;

  @override
  void initState() {
    super.initState();


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

                  //Top row
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.title, style: TypographyStyles().getHeadlineLarge(),),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [

                              AppBarButton(icon: Icons.swap_vert_sharp, onTap: onSortListButtonPressed,),

                              const Padding(padding: EdgeInsets.only(right: 8)),

                              AppBarButton(icon: Icons.add, onTap: onAddTimerButtonPressed,),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  //tab view
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DefaultTabController(
                        initialIndex: 1,
                        length: 3,
                        child: TabBar(
                          onTap: (int index) {
                            setState(() {
                              selectedTabPageIndex = index;
                            });
                          },
                          labelStyle: TypographyStyles().getLabelLarge(),
                          indicatorColor: Colors.white,
                          tabs: const [
                            Tab(text: 'Favorites',),
                            Tab(text: 'Odoo',),
                            Tab(text: 'Local',)
                          ],
                        )
                    ),
                  ),

                  //Tab Page
                  Expanded(child: getTabPage(selectedTabPageIndex))

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

  void onSortListButtonPressed() {

  }

  Widget getTabPage(int selectedIndex)
  {
    Widget selectedTabPage = Container();

    //Odoo Tab
    if (selectedIndex == 1)
    {
      selectedTabPage = Column(
        children: [

          //Text (number of timers)
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'You have 16 Timers',
                  style: TypographyStyles().getLabelLarge(),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),

          const Padding(padding: EdgeInsets.only(top: 16)),

          //listView
          Expanded(
            child: ListView.separated(
                itemBuilder: _getTimersListTile,
                separatorBuilder:(context, index) {
                  return const Divider(
                    //empty invisible divider
                    height: 0, thickness: 0, color: Colors.white,);
                 },
                itemCount: 1),
          )

        ],
      );
    }

    return selectedTabPage;
  }

  Widget _getTimersListTile(BuildContext context, int index) {
    return Container(
      //decorated container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0x14ffffff)
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          //column with timer specs and border
          Container(
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 2,
                  color: Color(0xffFFC629),
                )
              )
            ),
            child: Column(
              children: [

                //timer name
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    children: [
                      const Icon(Icons.star_border, size: 24, color: Colors.white),
                      Text('iOS App Deployment', style: TypographyStyles().getTitleMedium(),)
                    ],
                  ),
                ),

                //timer project
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    children: [
                      const Icon(Icons.cases_outlined, size: 24, color: Colors.white,),
                      Text('SO056 - Booqio V2', style: TypographyStyles().getBodyMedium(),),
                    ],
                  ),
                ),

                //deadline
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    children: [
                      const Icon(Icons.access_time_rounded, size: 24, color: Colors.white,),
                      Text('Deadline 07/20/2023', style: TypographyStyles().getBodyMedium(),)
                    ],
                  ),
                )
              ],
            ),
          ),

          Column(
            children: [
              //pause button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(64),
                  color: Colors.white
                ),
                //width: 104,
                //height: 48,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    //time
                    Text('00:30', style: TypographyStyles().getLabelLarge(specifiedColor: Colors.black),)

                    //pause icon
                  ],
                ),

              )
            ],
          )
        ],


      ),
    );
  }
}
