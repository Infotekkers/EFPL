import 'package:efpl/application/auth/auth/auth_bloc.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/domain/auth/i_auth_repository.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/fixtures/fixtures_view.dart';
import 'package:efpl/presentation/leagues/leagues_view.dart';
import 'package:efpl/presentation/points/points_view.dart';
import 'package:efpl/presentation/settings/settings_view.dart';
import 'package:efpl/presentation/stats/epl_stats_view.dart';
import 'package:efpl/presentation/team/team_view.dart';
import 'package:efpl/presentation/transfers/transfers_view_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../domain/auth/user.dart';

// ignore: must_be_immutable
class MainTabView extends StatelessWidget {
  MainTabView({Key? key}) : super(key: key);
  User? user;
  @override
  Widget build(BuildContext context) {
    var state = BlocProvider.of<AuthBloc>(context).state;
    if (state is Authenticated) {
      user = state.user;
    }
    return DefaultTabController(
      length: 7,
      initialIndex: 2,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  // color: ConstantColors.primary_800,
                  border: Border.all(color: Colors.white, width: 0.0),
                ),
                child: const Center(child: Text('Drawer Header')),
              ),
              ListTile(
                title: const Text('EPL Table'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('How To'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('About Us'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('LogOut'),
                onTap: () {
                  getIt<IAuthRepository>().removeUser();
                  Navigator.popAndPushNamed(context, "/sign-in");
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue[50],
          iconTheme: IconThemeData(color: Colors.blue[900]),
          elevation: 0,
          bottom: TabBar(
            unselectedLabelColor: const Color.fromARGB(255, 144, 201, 248),
            labelColor: Colors.blue[900],
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.blue[600],
            ),
            tabs: const [
              // My Team
              Tab(
                icon: Icon(
                  MdiIcons.accountGroup,
                ),
              ),

              // My Points
              Tab(
                icon: Icon(
                  MdiIcons.counter,
                ),
              ),
              // Transfers

              Tab(
                icon: Icon(
                  Boxicons.bx_transfer,
                ),
              ),

              // Fixtures
              Tab(
                icon: Icon(
                  MdiIcons.calendarMonth,
                ),
              ),
              // My Leagues
              Tab(
                icon: Icon(
                  MdiIcons.trophy,
                ),
              ),
              // Stats
              Tab(
                icon: Icon(
                  Icons.leaderboard,
                ),
              ),

              // Settings
              Tab(
                icon: Icon(
                  Icons.settings,
                ),
              ),
            ],
          ),
          title: Text(
            'EFPL',
            style: TextStyle(
              color: Colors.blue[900],
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            const TeamView(),
            const PointsView(),
            const TransfersView(),
            const FixturesView(),
            const LeaguesView(),
            const EPLStatsView(),
            SettingsView(
              user: user!,
            ),
          ],
        ),
      ),
    );
  }
}
