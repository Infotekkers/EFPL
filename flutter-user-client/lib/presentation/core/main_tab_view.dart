// ignore_for_file: prefer_const_constructors

import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/fixtures/fixtures_view.dart';
import 'package:efpl/presentation/leagues/leagues_view.dart';
import 'package:efpl/presentation/points/points_view.dart';
import 'package:efpl/presentation/settings/settings_view.dart';
import 'package:efpl/presentation/stats/stats_view.dart';
import 'package:efpl/presentation/team/team_view.dart';
import 'package:efpl/presentation/transfers/transfers_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainTabView extends StatelessWidget {
  const MainTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UtilBloc _utilBloc = getIt<UtilBloc>();
    _utilBloc.add(const UtilEvent.setDefaultLocale());

    return DefaultTabController(
      length: 7,
      initialIndex: 6,
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
                title: const Text('Watch List'),
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
          elevation: 8.0,
          bottom: const TabBar(
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
        body: TabBarView(
          children: [
            TeamView(),
            PointsView(),
            TransfersView(),
            FixtureView(),
            LeaguesView(),
            StatsView(),
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<UtilBloc>(),
                )
              ],
              child: SettingsView(),
            )
          ],
        ),
      ),
    );
  }
}
