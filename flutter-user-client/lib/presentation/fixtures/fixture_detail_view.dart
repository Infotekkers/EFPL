import 'package:cached_network_image/cached_network_image.dart';
import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/fixtures/widgets/fixture_detail_event.dart';
import 'package:efpl/presentation/fixtures/widgets/fixture_detail_lineup.dart';
import 'package:efpl/services/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tab_container/tab_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FixtureDetailView extends StatelessWidget {
  const FixtureDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _fixtureBloc = getIt<FixtureBloc>();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _fixtureBloc),
      ],
      child: BlocConsumer<FixtureBloc, FixtureState>(
        listener: (context, state) {
          state.valueFailureOrSuccess.fold(
            () {},
            (either) {
              either.fold(
                (failure) {
                  failure[1].maybeMap(
                    // Connection issues
                    noConnection: (_) {
                      CustomSnackBar().showCustomSnackBar(
                        showContext: context,
                        headlineText:
                            AppLocalizations.of(context)!.noConnection + "!",
                        message: AppLocalizations.of(context)!
                                .couldNotContactTheServer +
                            "." +
                            AppLocalizations.of(context)!
                                .pleaseCheckYourConnection +
                            " !",
                        snackBarType: "warning",
                      );
                    },
                    socketError: (_) {
                      CustomSnackBar().showCustomSnackBar(
                        showContext: context,
                        headlineText:
                            AppLocalizations.of(context)!.noConnection + "!",
                        message: AppLocalizations.of(context)!
                                .pleaseCheckYourConnection +
                            " !",
                        snackBarType: "warning",
                      );
                    },
                    handShakeError: (_) {
                      CustomSnackBar().showCustomSnackBar(
                        showContext: context,
                        headlineText:
                            AppLocalizations.of(context)!.noConnection + "!",
                        message: AppLocalizations.of(context)!
                                .pleaseCheckYourConnection +
                            " !",
                        snackBarType: "warning",
                      );
                    },

                    // token issues
                    // unauthorized: (_) {
                    //   CustomSnackBar().showCustomSnackBar(
                    //     showContext: context,
                    //     headlineText:
                    //         AppLocalizations.of(context)!.pleaseLogin + "!",
                    //     message: AppLocalizations.of(context)!.couldNotVerify +
                    //         "." +
                    //         AppLocalizations.of(context)!
                    //             .pleaseLoginAndTryAgain +
                    //         " !",
                    //     snackBarType: "warning",
                    //   );
                    // },
                    // unauthenticated: (_) {
                    //   CustomSnackBar().showCustomSnackBar(
                    //     showContext: context,
                    //     headlineText:
                    //         AppLocalizations.of(context)!.pleaseLogin + " !",
                    //     message: AppLocalizations.of(context)!.couldNotVerify +
                    //         "." +
                    //         AppLocalizations.of(context)!
                    //             .pleaseLoginAndTryAgain +
                    //         " !",
                    //     snackBarType: "warning",
                    //   );
                    // },
                    unexpectedError: (_) {
                      CustomSnackBar().showCustomSnackBar(
                        showContext: context,
                        headlineText:
                            AppLocalizations.of(context)!.somethingWentWrong,
                        message:
                            AppLocalizations.of(context)!.somethingWentWrong +
                                "." +
                                AppLocalizations.of(context)!
                                    .pleaseLoginAndTryAgain +
                                " !",
                        snackBarType: "warning",
                      );
                    },

                    orElse: () {
                      // CustomSnackBar().showCustomSnackBar(
                      //   showContext: context,
                      //   headlineText: "Something went wrong.",
                      //   message: "Something went wrong. Try again!",
                      //   snackBarType: "error",
                      // );
                    },
                  );
                },
                (_) {},
              );
            },
          );
        },
        builder: (context, state) {
          // get match id from args
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>;
          final String matchId = args['matchId'];

          // get current fixture
          Fixture currentFixture = state.allFixtures
              .where((fixture) =>
                  fixture.matchId.value.fold(
                    (l) => '',
                    (r) => r,
                  ) ==
                  matchId)
              .toList()[0];

          // away players who scored
          Map awayTeamPlayersScoreInfo =
              currentFixture.awayTeamLineUp.value.fold(
            (l) => {},
            (r) => r,
          );
          List allAwayPlayersWhoScored =
              getPlayersWhoScored(teamScoreInfo: awayTeamPlayersScoreInfo);

          // home players who scored
          Map homeTeamPlayersScoreInfo =
              currentFixture.homeTeamLineUp.value.fold(
            (l) => {},
            (r) => r,
          );
          List allHomePlayersWhoScored =
              getPlayersWhoScored(teamScoreInfo: homeTeamPlayersScoreInfo);

          return Scaffold(
            // APP BAR
            appBar: AppBar(
              title: Text(
                getMatchAcronym(fixture: currentFixture),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.blue[50],
              ),
              backgroundColor: Colors.blue[50],
              foregroundColor: ConstantColors.primary_900,
              elevation: 0,
            ),

            // BODY
            body: LiquidPullToRefresh(
              onRefresh: () async {
                getIt<FixtureBloc>().add(
                  const FixtureEvent.loadFixtures(),
                );
              },
              height: 60,
              showChildOpacityTransition: false,
              color: ConstantColors.primary_900,
              animSpeedFactor: 2,
              child: Container(
                color: Colors.blue[50],
                child: Column(
                  children: [
                    // HEADER
                    Container(
                      height: 200,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Home Team
                          SizedBox(
                            height: 180,
                            width: MediaQuery.of(context).size.width * 0.30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 105,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl: getImageUrl(
                                        fixture: currentFixture, isHome: 1),
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  getShortName(
                                      fixture: currentFixture, isHome: 1),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 14,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),

                          // match Info
                          SizedBox(
                            height: 165,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                getShortStatus(fixture: currentFixture) !=
                                        "Not Live"
                                    ? Text(
                                        getShortStatus(fixture: currentFixture),
                                      )
                                    : Text(
                                        "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                //
                                const SizedBox(
                                  height: 8,
                                ),

                                getShortStatus(fixture: currentFixture) !=
                                        "Not Live"
                                    ? Text(
                                        currentFixture.score.value.fold(
                                          (l) => '',
                                          (r) => r
                                              .toString()
                                              .split("v")
                                              .join(" - "),
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      )
                                    : Text(
                                        getFormattedTime(
                                            fixture: currentFixture),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  getHomeTeamCity(
                                      context: context,
                                      currentFixture: currentFixture),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  getHomeTeamStadium(
                                    context: context,
                                    currentFixture: currentFixture,
                                  ),
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                ),

                                // Text(
                                //   "( " +
                                //       currentFixture.homeTeamCapacity.value
                                //           .fold(
                                //         (l) => '',
                                //         (r) => r.toString(),
                                //       ) +
                                //       " )",
                                //   style: Theme.of(context)
                                //       .textTheme
                                //       .bodyText1!
                                //       .copyWith(fontSize: 10),
                                // ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 175,
                            width: MediaQuery.of(context).size.width * 0.30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl: getImageUrl(
                                        fixture: currentFixture, isHome: 0),
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  getShortName(
                                      fixture: currentFixture, isHome: 0),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 14,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // SCORE INFO
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5,
                            color: ConstantColors.primary_800.withOpacity(0.25),
                          ),
                          top: BorderSide(
                            width: 0.5,
                            color: ConstantColors.primary_800.withOpacity(0.25),
                          ),
                        ),
                      ),
                      child: allHomePlayersWhoScored.isEmpty &&
                              allAwayPlayersWhoScored.isEmpty
                          ? const Center(
                              child: Icon(
                                FontAwesome.soccer_ball,
                                size: 30,
                              ),
                            )
                          : Row(
                              children: [
                                // Home Scorers
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: ListView.builder(
                                    itemCount: allHomePlayersWhoScored.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      List<int> _items = List.generate(
                                        allHomePlayersWhoScored[index]
                                            ['playerStat'][0]['goals'],
                                        (i) => i,
                                      );
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 5),
                                        child: Wrap(
                                          children: [
                                            Text(
                                              allHomePlayersWhoScored[index]
                                                  ['playerName'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Wrap(
                                              direction: Axis.horizontal,
                                              children: _items
                                                  .map(
                                                    (i) => const Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                        3,
                                                        0,
                                                        0,
                                                        0,
                                                      ),
                                                      child: Icon(
                                                        FontAwesome.soccer_ball,
                                                        size: 15,
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                // Away Scorers
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: ListView.builder(
                                    itemCount: allAwayPlayersWhoScored.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      List<int> _items = List.generate(
                                        allAwayPlayersWhoScored[index]
                                            ['playerStat'][0]['goals'],
                                        (i) => i,
                                      );
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 6),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              40, 0, 0, 0),
                                          child: Wrap(
                                            children: [
                                              Text(
                                                allAwayPlayersWhoScored[index]
                                                    ['playerName'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Wrap(
                                                direction: Axis.horizontal,
                                                children: _items
                                                    .map(
                                                      (i) => const Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                3, 0, 0, 0),
                                                        child: Icon(
                                                          FontAwesome
                                                              .soccer_ball,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                    ),

                    // Tab View

                    SizedBox(
                      height: MediaQuery.of(context).size.height - 410,
                      child: TabContainer(
                        radius: 0,
                        color: Colors.blue[100],
                        children: [
                          SingleChildScrollView(
                              child:
                                  FixtureDetailLineUp(fixture: currentFixture)),
                          FixtureDetailEvent(fixture: currentFixture),
                        ],
                        tabs: [
                          AppLocalizations.of(context)!.lineUps,
                          AppLocalizations.of(context)!.events,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

String getMatchAcronym({required Fixture fixture}) {
  List homeTeamLong = [];

  if (getIt<UtilBloc>().state.locale.languageCode == "en") {
    homeTeamLong = fixture.homeTeam.value
        .fold(
          (l) => null,
          (r) => r,
        )!
        .split(" ");
  } else {
    homeTeamLong = fixture.homeTeamAmh.value
        .fold(
          (l) => null,
          (r) => r,
        )!
        .split(" ");
  }

  homeTeamLong.removeLast();

  String homeTeamShort = "";
  for (var homeTeam in homeTeamLong) {
    if (homeTeamLong.length == 3) {
      homeTeamShort = homeTeamShort + homeTeam.split("")[0];
    } else if (homeTeamLong.length < 3) {
      if (homeTeamShort.length < 2) {
        homeTeamShort = homeTeamShort +
            homeTeam.split("")[0].toString().toUpperCase() +
            homeTeam.split("")[1].toString().toUpperCase();
      } else {
        homeTeamShort =
            homeTeamShort + homeTeam.split("")[0].toString().toUpperCase();
      }
    }
  }

  //
  List? awayTeamLong = [];

  if (getIt<UtilBloc>().state.locale.languageCode == "en") {
    awayTeamLong = fixture.awayTeam.value
        .fold(
          (l) => null,
          (r) => r,
        )!
        .split(" ");
  } else {
    awayTeamLong = fixture.awayTeamAmh.value
        .fold(
          (l) => null,
          (r) => r,
        )!
        .split(" ");
  }

  String awayTeamShort = "";
  awayTeamLong.removeLast();
  for (var awayTeam in awayTeamLong) {
    if (awayTeamLong.length == 3) {
      awayTeamShort = awayTeamShort + awayTeam.split("")[0];
    } else if (awayTeamLong.length < 3) {
      if (awayTeamShort.length < 2) {
        awayTeamShort = awayTeamShort +
            awayTeam.split("")[0].toString().toUpperCase() +
            awayTeam.split("")[1].toString().toUpperCase();
      } else {
        awayTeamShort =
            awayTeamShort + awayTeam.split("")[0].toString().toUpperCase();
      }
    }
  }

  return (homeTeamShort + " v " + awayTeamShort);
}

String getShortName({required Fixture fixture, required int isHome}) {
  final Locale locale = getIt<UtilBloc>().state.locale;
  if (isHome == 1) {
    if (locale.languageCode == "en") {
      List nameLong = fixture.homeTeam.value
          .fold(
            (l) => '',
            (r) => r.toString(),
          )
          .split(" ");

      nameLong.removeLast();
      return nameLong.join(" ");
    } else {
      return fixture.homeTeamAmh.value.fold((l) => "", (r) => r);
    }
  } else {
    if (locale.languageCode == "en") {
      List nameLong = fixture.awayTeam.value
          .fold(
            (l) => '',
            (r) => r.toString(),
          )
          .split(" ");
      nameLong.removeLast();
      return nameLong.join(" ");
    } else {
      return fixture.awayTeamAmh.value.fold((l) => "", (r) => r);
    }
  }
}

String getImageUrl({required Fixture fixture, required int isHome}) {
  String finalPath = dotenv.env["API"].toString();
  if (isHome == 1) {
    String path = fixture.homeTeamLogo.value.fold(
      (l) => '',
      (r) => r.toString(),
    );

    finalPath = finalPath + path;
  } else {
    String path = fixture.awayTeamLogo.value.fold(
      (l) => '',
      (r) => r.toString(),
    );
    finalPath = finalPath + path;
  }
  return finalPath;
}

String getShortStatus({required Fixture fixture}) {
  String status = fixture.status.value.fold((l) => '', (r) => r);

  String finalStatus = "Not Live";

  if (status == "liveFH") {
    finalStatus = "FH";
  } else if (status == "HT") {
    finalStatus = "HT";
  } else if (status == "liveSH") {
    finalStatus = "SH";
  } else if (status == "FT") {
    finalStatus = "FT";
  }

  return finalStatus;
}

String getFormattedTime({required Fixture fixture}) {
  String scheduleString = fixture.schedule.value.fold(
    (l) => '',
    (r) => r,
  );

  final dateTime = DateTime.parse(scheduleString);
  String hour = dateTime.hour < 10
      ? "0" + dateTime.hour.toString()
      : dateTime.hour.toString();
  String minute = dateTime.minute < 10
      ? "0" + dateTime.minute.toString()
      : dateTime.minute.toString();
  return hour + ":" + minute;
}

List getPlayersWhoScored({required Map teamScoreInfo}) {
  // empty list to track players who scored
  List allPlayersWhoScored = [];

  for (var position in teamScoreInfo.keys) {
    List currentPositionList = teamScoreInfo[position];

    List playersWhoScored = currentPositionList
        .where((currentPlayer) => currentPlayer['playerStat'][0]['goals'] > 0)
        .toList();

    if (playersWhoScored.isNotEmpty) {
      for (var scoredPlayer in playersWhoScored) {
        allPlayersWhoScored.add(scoredPlayer);
      }
    }
  }

  return allPlayersWhoScored;
}

String getHomeTeamCity(
    {required Fixture currentFixture, required BuildContext context}) {
  String homeTeamCity = currentFixture.homeTeamCity.value.fold(
    (l) => '',
    (r) => r.toString(),
  );
  String homeTeamCityResult = "";
  switch (homeTeamCity) {
    case "Addis Ababa":
      homeTeamCityResult = AppLocalizations.of(context)!.addisAbaba;
      break;

    case "Wolaita Sodo":
      homeTeamCityResult = AppLocalizations.of(context)!.wolaitaSodo;
      break;
    case "Hawassa":
      homeTeamCityResult = AppLocalizations.of(context)!.hawassa;
      break;
    case "Gondar":
      homeTeamCityResult = AppLocalizations.of(context)!.gondar;
      break;
    case "Adama":
      homeTeamCityResult = AppLocalizations.of(context)!.adama;
      break;
    case "Sidama":
      homeTeamCityResult = AppLocalizations.of(context)!.sidama;
      break;
    case "Bahir Dar":
      homeTeamCityResult = AppLocalizations.of(context)!.bahirDar;
      break;
    case "Wolkite":
      homeTeamCityResult = AppLocalizations.of(context)!.wolkite;
      break;
    case "Arba Minch":
      homeTeamCityResult = AppLocalizations.of(context)!.arbaMinch;
      break;
    case "Hosaena":
      homeTeamCityResult = AppLocalizations.of(context)!.hosaena;
      break;
    case "Dire Dawa":
      homeTeamCityResult = AppLocalizations.of(context)!.direDawa;
      break;
    case "Jimma":
      homeTeamCityResult = AppLocalizations.of(context)!.jimma;
      break;
    case "Sebeta":
      homeTeamCityResult = AppLocalizations.of(context)!.sebeta;
      break;
    default:
      homeTeamCityResult = "------";
  }

  return homeTeamCityResult;
}

String getHomeTeamStadium(
    {required Fixture currentFixture, required BuildContext context}) {
  String homeTeamStadium = currentFixture.homeTeamStadium.value.fold(
    (l) => '',
    (r) => r.toString(),
  );
  String homeTeamStadiumResult = "";
  switch (homeTeamStadium) {
    case "Addis Ababa":
      homeTeamStadiumResult = AppLocalizations.of(context)!.addisAbaba;
      break;
    case "Sebeta Stadium":
      homeTeamStadiumResult = AppLocalizations.of(context)!.sebetaStadium;
      break;
    case "Jimma Stadium":
      homeTeamStadiumResult = AppLocalizations.of(context)!.jimmaStadium;
      break;
    case "Addis Ababa Stadium":
      homeTeamStadiumResult = AppLocalizations.of(context)!.addisAbabaStadium;
      break;
    case "Dire Dawa Stadium":
      homeTeamStadiumResult = AppLocalizations.of(context)!.direDawaStadium;
      break;
    case "Abiy Hersamo Stadium":
      homeTeamStadiumResult = AppLocalizations.of(context)!.abiyHersamoStadium;
      break;
    case "Arba Minch Stadium":
      homeTeamStadiumResult = AppLocalizations.of(context)!.arbaMinchStadium;
      break;
    case "Wolkite Stadium":
      homeTeamStadiumResult = AppLocalizations.of(context)!.wolkiteStadium;
      break;
    case "Bahir Dar Stadium":
      homeTeamStadiumResult = AppLocalizations.of(context)!.arbaMinchStadium;
      break;
    case "Hawasa Metropolitan Stadium":
      homeTeamStadiumResult =
          AppLocalizations.of(context)!.hawasaMetropolitanStadium;
      break;
    case "Abebe Bikila Stadium":
      homeTeamStadiumResult = AppLocalizations.of(context)!.abebeBikilaStadium;
      break;
    case "Fasiledes Stadium":
      homeTeamStadiumResult = AppLocalizations.of(context)!.fasiledesStadium;
      break;
    case "Awassa Kenema Stadium":
      homeTeamStadiumResult = AppLocalizations.of(context)!.awassaKenemaStadium;
      break;
    case "Wolaita Sodo Stadium":
      homeTeamStadiumResult = AppLocalizations.of(context)!.wolaitaSodoStadium;
      break;
    default:
      homeTeamStadiumResult = "------";
  }

  return homeTeamStadiumResult;
}
