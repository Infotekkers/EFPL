import 'package:efpl/presentation/player/widgets/player_overview.dart';
import 'package:efpl/presentation/player/widgets/player_stats.dart';
import 'package:flutter/material.dart';

class PlayerTab extends StatelessWidget {
  const PlayerTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(text: "Details"),
            Tab(text: "Stats"),
          ]),
        ),
        body: const TabBarView(children: [
          PlayerOverview(),
          PlayerStats(),
        ]),
      ),
    );
  }
}
