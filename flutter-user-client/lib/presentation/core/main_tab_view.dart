import 'package:efpl/application/auth/auth/auth_bloc.dart';
import 'package:efpl/domain/auth/i_auth_repository.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/fixtures/fixtures_view.dart';
import 'package:efpl/presentation/leagues/leagues_view.dart';
import 'package:efpl/presentation/points/points_view.dart';
import 'package:efpl/presentation/settings/settings_view.dart';
import 'package:efpl/presentation/stats/epl_stats_view.dart';
import 'package:efpl/presentation/team/team_view.dart';
import 'package:efpl/presentation/transfers/transfers_view_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:showcaseview/showcaseview.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({Key? key}) : super(key: key);

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   ShowCaseWidget.of(context)!.startShowCase([_key1]);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final AuthBloc _authBloc = getIt<AuthBloc>();
    _authBloc.add(
      const AuthEvent.tokenCheckRequested(),
    );

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
                title: const Text('WatchList'),
                onTap: () {
                  Navigator.pushNamed(context, "/watchList");
                },
              ),
              ListTile(
                title: const Text('EPL Table'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('EPFL Stats'),
                onTap: () {
                  Navigator.pushNamed(context, "/efpl");
                },
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
              ),
              ListTile(
                title: const Text('check token'),
                onTap: () async {
                  const storage = FlutterSecureStorage();
                  await storage.delete(key: 'user');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.blue[50],
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.blue[50],
          iconTheme: IconThemeData(color: Colors.blue[900]),
          elevation: 0,
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  ShowCaseWidget.of(context)!.startShowCase([]);
                });
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 12.0, 8.0),
                child: Icon(Icons.help_outline),
              ),
            )
          ],
          bottom: TabBar(
            unselectedLabelColor: const Color.fromARGB(255, 144, 201, 248),
            labelColor: Colors.blue[900],
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.blue[600],
            ),
            tabs: [
              // My Team
              Tab(
                icon: const Icon(
                  MdiIcons.accountGroup,
                ),
              ),

              // My Points
              Tab(
                icon: const Icon(
                  MdiIcons.counter,
                ),
              ),
              // Transfers

              Tab(
                icon: const Icon(
                  Boxicons.bx_transfer,
                ),
              ),

              // Fixtures
              Tab(
                icon: const Icon(
                  MdiIcons.calendarMonth,
                ),
              ),
              // My Leagues
              Tab(
                icon: const Icon(
                  MdiIcons.trophy,
                ),
              ),
              // Stats
              Tab(
                icon: const Icon(
                  Icons.leaderboard,
                ),
              ),

              // Settings
              Tab(
                icon: const Icon(
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
        body: const TabBarView(
          children: [
            TeamView(),
            PointsView(),
            TransfersView(),
            FixturesView(),
            LeaguesView(),
            EPLStatsView(),
            SettingsView(),
          ],
        ),
      ),
    );
  }
}
