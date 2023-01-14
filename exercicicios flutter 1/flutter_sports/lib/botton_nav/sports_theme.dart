import 'package:flutter/material.dart';
import 'package:flutter_sports/models/sports.dart';
import 'package:flutter_sports/pages/calendar_page.dart';
import 'package:flutter_sports/pages/profile_page.dart';
import 'package:flutter_sports/pages/ranking_page.dart';
import 'package:flutter_sports/pages/sports_page.dart';
import 'package:flutter_sports/resources/strings.dart';

import '../resources/images.dart';

class SportsGym extends StatefulWidget {
  const SportsGym({
    Key? key,
    required this.onThemeModePressed,
  }) : super(key: key);

  final VoidCallback onThemeModePressed;

  @override
  _SportsGymState createState() => _SportsGymState();
}

class _SportsGymState extends State<SportsGym> {
  final pageController = PageController();

  int currentPage = 0;

  final sports = [
    Sport(name: Strings.baseball, icon: Icons.sports_baseball, cover: Images.baseball),
    Sport(name: Strings.basketball, icon: Icons.sports_basketball, cover: Images.basketball),
    Sport(name: Strings.football, icon: Icons.sports_football, cover: Images.football),
  ];
  // final tabs = const [
  //           Tab(icon: Icon(Icons.sports_baseball)),
  //           Tab(icon: Icon(Icons.sports_basketball)),
  //           Tab(icon: Icon(Icons.sports_football)),
  //         ];

  void onItempressed(int index) {
    pageController.jumpToPage(index);
    // pageController.animateToPage(index,
    //     duration: const Duration(milliseconds: 400),
    //     curve: Curves.ease);
    setState(() {
      currentPage = index;
    });
  }

  void onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: sports.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.appName),
          actions: [
            IconButton(
              onPressed: widget.onThemeModePressed,
              icon: Icon(
                theme.brightness == Brightness.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
            ),
          ],
          bottom: currentPage == 0
              ? TabBar(
                  tabs: sports.map((sport) => Tab(icon: Icon(sport.icon))).toList(),
                  // isScrollable: true,
                  indicatorColor: Colors.greenAccent,
                )
              : null,
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
          children:  [
            SportsPage(sports: sports),
            const RankingPage(),
            const CalendrPage(),
            const ProfilePage(),
            
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 2.0,
          child: const Icon(Icons.share),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentPage,
            onTap: onItempressed,
            showSelectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: Strings.sports,
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: Strings.ranking,
                // backgroundColor: Colors.redAccent,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: Strings.calendar,
                // backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person), label: Strings.profile,
                // backgroundColor: Colors.purpleAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
