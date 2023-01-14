import 'package:flutter/material.dart';
import 'package:flutter_sports/models/sports.dart';
import 'package:flutter_sports/tabs/sport_tab.dart';


class SportsPage extends StatelessWidget {
  const SportsPage({Key? key, required this.sports}) : super(key: key);

  final List<Sport> sports;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        for(final sport in sports) SportTab(sport: sport)
        // SportTab(sport: sports[0]),
        // SportTab(sport: sports[1]),
        // SportTab(sport: sports[2]),
      ],
    );
    // return const Center(child: Text(Strings.sports);
  }
}
