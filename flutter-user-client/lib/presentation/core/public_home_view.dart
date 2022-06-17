import 'package:efpl/presentation/core/auth_locale_widget.dart';
import 'package:efpl/presentation/fixtures/fixtures_view.dart';
import 'package:efpl/presentation/leaguetables/leaguetable_view.dart';
import 'package:efpl/presentation/stats/epl_stats_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PublicHome extends StatelessWidget {
  const PublicHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.blue[50],
              statusBarIconBrightness: Brightness.dark,
            ),
            backgroundColor: Colors.blue[50],
            iconTheme: IconThemeData(color: Colors.blue[900]),
            elevation: 0,
            toolbarHeight: 50,
            bottom: TabBar(
              unselectedLabelColor: const Color.fromARGB(255, 144, 201, 248),
              labelColor: Colors.blue[900],
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.blue[600],
              ),
              tabs: const [
                // Fixtures
                Tab(
                  child: Icon(
                    MdiIcons.calendarMonth,
                  ),
                ),

                // EPL Stats
                Tab(
                  child: Icon(
                    Icons.leaderboard,
                  ),
                ),

                // Table
                Tab(
                  child: Icon(
                    Icons.table_chart,
                  ),
                ),
              ],
            ),
            title: Container(
              margin: const EdgeInsets.fromLTRB(32, 32, 12, 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title
                  Text(
                    'EFPL',
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(
                    width: 170,
                  ),

                  // Container(
                  //   width: 100,
                  //   height: 36,
                  //   // color: .primary_900,
                  //   // color: ,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.blueAccent),
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       "Login",
                  //       style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  //             fontSize: 14,
                  //             color: ConstantColors.primary_900,
                  //           ),
                  //     ),
                  //   ),
                  // ),
                  IconButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/register");
                      },
                      icon: const Icon(
                        Typicons.user_add,
                        size: 30,
                      )),
                  // Container(
                  //   width: 100,
                  //   height: 36,
                  //   color: ConstantColors.primary_900,
                  //   child: Center(
                  //     child: Text(
                  //       "Register",
                  //       style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  //             fontSize: 14,
                  //             color: ConstantColors.neutral_200,
                  //           ),
                  //     ),
                  //   ),
                  // )
                  IconButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/sign-in");
                      },
                      icon: const Icon(
                        MdiIcons.login,
                        size: 30,
                      ))
                ],
              ),
            ),
          ),
          body: Stack(
            children: const [
              TabBarView(
                children: [
                  FixturesView(),
                  EPLStatsView(),
                  LeagueTableView(),
                ],
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: AuthLocaleWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
