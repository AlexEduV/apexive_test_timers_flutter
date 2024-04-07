
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
                        Text(widget.title, style: TypographyStyles.headlineLarge,),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: const [

                              AppBarButton(icon: Icons.sync_alt),

                              Padding(padding: EdgeInsets.only(right: 8)),

                              AppBarButton(icon: Icons.add),
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
                          labelStyle: TypographyStyles.labelLarge,
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
                  getTabPage(selectedTabPageIndex)

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

  //void onListSortButtonPressed() {}

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
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'You have 16 Timers',
                  style: TypographyStyles.labelLarge,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),

          //listView
          ListView.separated(
              itemBuilder: _getTimersListTile,
              separatorBuilder:(context, index) {
                return const Divider(
                  //empty invisible divider
                  height: 0, thickness: 0, color: Colors.white,);
               },
              itemCount: 1)

        ],
      );
    }

    return selectedTabPage;
  }

  Widget _getTimersListTile(BuildContext context, int index) {
    return Container(
      height: 40,
    );
  }
}
