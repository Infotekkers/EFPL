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
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({Key? key}) : super(key: key);

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  final _myTeamTabKey = GlobalKey();
  final _pointsTabKey = GlobalKey();
  final _transferTabKey = GlobalKey();
  final _fixtureTabKey = GlobalKey();
  final _leaguesTabKey = GlobalKey();
  final _statsTabKey = GlobalKey();
  final _settingTabKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthBloc _authBloc = getIt<AuthBloc>();
    _authBloc.add(
      const AuthEvent.tokenCheckRequested(),
    );

    return Scaffold(
      body: DefaultTabController(
        length: 7,
        initialIndex: 2,
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 250,
                  padding: const EdgeInsets.fromLTRB(16, 30, 12, 16),
                  width: MediaQuery.of(context).size.width,
                  // color: ConstantColors.primary_900,
                  color: Colors.blue[50],
                  child: Stack(
                    children: [
                      // Title
                      Center(
                        child: Text(
                          "Ethiopian Fantasy Premier League",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: ConstantColors.primary_900,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.55,
                                  ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.star,
                        color: ConstantColors.primary_900,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Center(child: Text('Watch List'))
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/watchList");
                  },
                ),
                ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.table_chart,
                        color: ConstantColors.primary_900,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Center(child: Text('EPL Table'))
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/EPLeagueTable");
                  },
                ),
                ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Boxicons.bx_stats,
                        color: ConstantColors.primary_900,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Center(child: Text('EFPL Stats'))
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/efpl");
                  },
                ),
                ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        MdiIcons.accountGroup,
                        color: ConstantColors.primary_900,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Center(child: Text('About Us'))
                    ],
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        MdiIcons.logout,
                        color: ConstantColors.primary_900,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('LogOut')
                    ],
                  ),
                  onTap: () {
                    getIt<IAuthRepository>().removeUser();
                    // Navigator.pop(context);
                    // Navigator.pushNamed(context, "/public");
                    Navigator.of(context)
                        .popUntil(ModalRoute.withName('/public'));
                    Navigator.pushNamed(context, "/public");
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
                    ShowCaseWidget.of(context)!.startShowCase([
                      _myTeamTabKey,
                      _pointsTabKey,
                      _transferTabKey,
                      _fixtureTabKey,
                      _leaguesTabKey,
                      _statsTabKey,
                      _settingTabKey,
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
                  icon: Tooltip(
                    message: "My Team",
                    child: Showcase(
                      key: _myTeamTabKey,
                      title: AppLocalizations.of(context)!.myTeamTabKeyTitle,
                      description:
                          AppLocalizations.of(context)!.myTeamTabKeyDesc,
                      shapeBorder: const CircleBorder(),
                      showcaseBackgroundColor: ConstantColors.primary_900,
                      titleTextStyle:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: ConstantColors.neutral_200,
                                height: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.55,
                              ),
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
                ),

                // My Points
                Tab(
                  icon: Tooltip(
                    message: "Points",
                    child: Showcase(
                      key: _pointsTabKey,
                      title: AppLocalizations.of(context)!.pointsTabKeyTitle,
                      description:
                          AppLocalizations.of(context)!.pointsTabKeyDesc,
                      shapeBorder: const CircleBorder(),
                      showcaseBackgroundColor: ConstantColors.primary_900,
                      titleTextStyle:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: ConstantColors.neutral_200,
                                height: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.55,
                              ),
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
                ),

                // Transfers
                Tab(
                  icon: Tooltip(
                    message: "Transfers",
                    child: Showcase(
                      key: _transferTabKey,
                      title: AppLocalizations.of(context)!.transfersTabKeyTitle,
                      description:
                          AppLocalizations.of(context)!.transfersTabKeyDesc,
                      shapeBorder: const CircleBorder(),
                      showcaseBackgroundColor: ConstantColors.primary_900,
                      titleTextStyle:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: ConstantColors.neutral_200,
                                height: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.55,
                              ),
                      descTextStyle:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: ConstantColors.neutral_200,
                                height: 1.5,
                              ),
                      overlayPadding: const EdgeInsets.all(8),
                      contentPadding: const EdgeInsets.fromLTRB(90, 12, 12, 12),
                      child: const Icon(
                        Boxicons.bx_transfer,
                        key: Key("mainTabViewBarTransferKey"),
                      ),
                    ),
                  ),
                ),

                // Fixtures
                Tab(
                  icon: Tooltip(
                    message: "Fixtures",
                    child: Showcase(
                      key: _fixtureTabKey,
                      title: AppLocalizations.of(context)!.fixturesTabKeyTitle,
                      description:
                          AppLocalizations.of(context)!.fixturesTabKeyDesc,
                      shapeBorder: const CircleBorder(),
                      showcaseBackgroundColor: ConstantColors.primary_900,
                      titleTextStyle:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: ConstantColors.neutral_200,
                                height: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.55,
                              ),
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
                ),

                // My Leagues
                Tab(
                  icon: Tooltip(
                    message: "Leagues",
                    child: Showcase(
                      key: _leaguesTabKey,
                      title: AppLocalizations.of(context)!.leaguesTabKeyTitle,
                      description:
                          AppLocalizations.of(context)!.leaguesTabKeyDesc,
                      shapeBorder: const CircleBorder(),
                      showcaseBackgroundColor: ConstantColors.primary_900,
                      titleTextStyle:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: ConstantColors.neutral_200,
                                height: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.55,
                              ),
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
                ),
                // Stats
                Tab(
                  icon: Tooltip(
                    message: "EPL Stats",
                    child: Showcase(
                      key: _statsTabKey,
                      title: AppLocalizations.of(context)!.statsTabKeyTitle,
                      description:
                          AppLocalizations.of(context)!.statsTabKeyDesc,
                      shapeBorder: const CircleBorder(),
                      showcaseBackgroundColor: ConstantColors.primary_900,
                      titleTextStyle:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: ConstantColors.neutral_200,
                                height: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.55,
                              ),
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
                ),

                // Settings
                Tab(
                  icon: Tooltip(
                    message: "Settings",
                    child: Showcase(
                      key: _settingTabKey,
                      title: AppLocalizations.of(context)!.settingTabKeyTitle,
                      description:
                          AppLocalizations.of(context)!.settingsTabKeyDesc,
                      shapeBorder: const CircleBorder(),
                      showcaseBackgroundColor: ConstantColors.primary_900,
                      titleTextStyle:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: ConstantColors.neutral_200,
                                height: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.55,
                              ),
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
      ),
    );
  }
}
