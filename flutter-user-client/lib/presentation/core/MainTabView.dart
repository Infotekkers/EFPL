import 'package:efpl/presentation/fixtures/FixturesView.dart';
import 'package:efpl/presentation/leauges/LeaguesView.dart';
import 'package:efpl/presentation/points/PointsView.dart';
import 'package:efpl/presentation/settings/SettingsView.dart';
import 'package:efpl/presentation/stats/StatsView.dart';
import 'package:efpl/presentation/team/TeamView.dart';
import 'package:efpl/presentation/transfers/TransfersView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainTabView extends StatelessWidget {
  const MainTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(child: Text('Drawer Header')),
              ),
              ListTile(
                title: const Text('EPL Table'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Watchlist'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Credit'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('How To'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: (Colors.blue),
          elevation: 8.0,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              // My Team
              Tab(
                icon: Icon(
                  MdiIcons.accountGroup,
                  color: Colors.white,
                ),
              ),

              // My Points
              Tab(
                icon: Icon(
                  MdiIcons.counter,
                  color: Colors.white,
                ),
              ),
              // Transfers

              Tab(
                icon: Icon(
                  Boxicons.bx_transfer,
                  color: Colors.white,
                ),
              ),

              // Fixtures
              Tab(
                icon: Icon(
                  MdiIcons.calendarMonth,
                  color: Colors.white,
                ),
              ),
              // My Leagues
              Tab(
                icon: Icon(
                  MdiIcons.trophy,
                  color: Colors.white,
                ),
              ),
              // Stats
              Tab(
                icon: Icon(
                  Icons.leaderboard,
                  color: Colors.white,
                ),
              ),

              // Settings
              Tab(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          title: const Text(
            'EFPL',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        body: const TabBarView(
          children: [
            TeamView(),
            PointsView(),
            TransfersView(),
            FixtureView(),
            LeaguesView(),
            StatsView(),
            SettingsView(),
          ],
        ),
      ),
    );
  }
}
