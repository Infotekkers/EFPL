import 'package:efpl/application/util/util_bloc.dart';
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
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:showcaseview/showcaseview.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({Key? key}) : super(key: key);

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  final _myTeamTab = GlobalKey();
  final _pointsTab = GlobalKey();
  final _transfersTab = GlobalKey();
  final _fixturesTab = GlobalKey();
  final _leaugesTab = GlobalKey();
  final _eplStatsTab = GlobalKey();
  final _settingsTab = GlobalKey();

  final GlobalKey _teamNameKey = GlobalKey();
  final _nextGameWeekKey = GlobalKey();
  final _previousGameWeekKey = GlobalKey();
  final _gameWeekInfoKey = GlobalKey();
  final _pointsSumKey = GlobalKey();
  final _playerCardKey = GlobalKey();
  final _playerJersyKey = GlobalKey();
  final _playerName = GlobalKey();
  final _playerPoint = GlobalKey();
  final _captainKey = GlobalKey();
  final _deductionBoxKey = GlobalKey();
  final _viceCaptainKey = GlobalKey();
  final _startersKey = GlobalKey();
  final _benchKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   ShowCaseWidget.of(context)!.startShowCase([_key1]);
    // });
  }

  @override
  Widget build(BuildContext context) {
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
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  ShowCaseWidget.of(context)!.startShowCase([
                    _myTeamTab,
                    _pointsTab,
                    _transfersTab,
                    _fixturesTab,
                    _leaugesTab,
                    _eplStatsTab,
                    _settingsTab
                  ]);
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
                icon: Showcase(
                  key: _myTeamTab,
                  description:
                      'Team Tab\nCheck Your Team Information here. Go To Tab For More',
                  shapeBorder: const CircleBorder(),
                  showcaseBackgroundColor: ConstantColors.primary_900,
                  descTextStyle:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ConstantColors.neutral_200,
                            height: 1.5,
                          ),
                  overlayPadding: const EdgeInsets.all(8),
                  contentPadding: const EdgeInsets.all(20),
                  child: const Icon(
                    MdiIcons.accountGroup,
                  ),
                ),
              ),

              // My Points
              Tab(
                icon: Showcase(
                  key: _pointsTab,
                  description:
                      "Points\nCheck Your Team's point here. Go To Tab For More",
                  shapeBorder: const CircleBorder(),
                  showcaseBackgroundColor: ConstantColors.primary_900,
                  descTextStyle:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ConstantColors.neutral_200,
                            height: 1.5,
                          ),
                  overlayPadding: const EdgeInsets.all(8),
                  contentPadding: const EdgeInsets.all(20),
                  child: const Icon(
                    MdiIcons.counter,
                  ),
                ),
              ),
              // Transfers

              Tab(
                icon: Showcase(
                  key: _transfersTab,
                  description:
                      'Transfers Tab\nChange your players here. Go To Tab For More',
                  shapeBorder: const CircleBorder(),
                  showcaseBackgroundColor: ConstantColors.primary_900,
                  descTextStyle:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ConstantColors.neutral_200,
                            height: 1.5,
                          ),
                  overlayPadding: const EdgeInsets.all(8),
                  contentPadding: const EdgeInsets.all(20),
                  child: const Icon(
                    Boxicons.bx_transfer,
                  ),
                ),
              ),

              // Fixtures
              Tab(
                icon: Showcase(
                  key: _fixturesTab,
                  description:
                      'Fixtures Tab\nChange past and upcoming matches here. Go To Tab For More',
                  shapeBorder: const CircleBorder(),
                  showcaseBackgroundColor: ConstantColors.primary_900,
                  descTextStyle:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ConstantColors.neutral_200,
                            height: 1.5,
                          ),
                  overlayPadding: const EdgeInsets.all(8),
                  contentPadding: const EdgeInsets.all(20),
                  child: const Icon(
                    MdiIcons.calendarMonth,
                  ),
                ),
              ),
              // My Leagues
              Tab(
                icon: Showcase(
                  key: _leaugesTab,
                  description:
                      'Leagues Tab\nView your leagues and standing here. Go To Tab For More',
                  shapeBorder: const CircleBorder(),
                  showcaseBackgroundColor: ConstantColors.primary_900,
                  descTextStyle:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ConstantColors.neutral_200,
                            height: 1.5,
                          ),
                  overlayPadding: const EdgeInsets.all(8),
                  contentPadding: const EdgeInsets.all(20),
                  child: const Icon(
                    MdiIcons.trophy,
                  ),
                ),
              ),
              // Stats
              Tab(
                icon: Showcase(
                  key: _eplStatsTab,
                  description:
                      'Stats Tab\nCheck EPL players information here. Go To Tab For More',
                  shapeBorder: const CircleBorder(),
                  showcaseBackgroundColor: ConstantColors.primary_900,
                  descTextStyle:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ConstantColors.neutral_200,
                            height: 1.5,
                          ),
                  overlayPadding: const EdgeInsets.all(8),
                  contentPadding: const EdgeInsets.all(20),
                  child: const Icon(
                    Icons.leaderboard,
                  ),
                ),
              ),

              // Settings
              Tab(
                icon: Showcase(
                  key: _settingsTab,
                  description:
                      'Settings Tab\nChange your preferences here. Go To Tab For More',
                  shapeBorder: const CircleBorder(),
                  showcaseBackgroundColor: ConstantColors.primary_900,
                  descTextStyle:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ConstantColors.neutral_200,
                            height: 1.5,
                          ),
                  overlayPadding: const EdgeInsets.all(8),
                  contentPadding: const EdgeInsets.all(20),
                  child: const Icon(
                    Icons.settings,
                  ),
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
