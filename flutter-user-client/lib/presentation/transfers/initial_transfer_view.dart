import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/core/player_card.dart';
import 'package:efpl/services/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InitialTransferPage extends StatelessWidget {
  const InitialTransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _transferBloc = getIt<TransferBloc>();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _transferBloc),
      ],
      child: BlocConsumer<TransferBloc, TransferState>(
        listener: (context, state) {
          state.valueFailureOrSuccess.fold(
            () {},
            (either) {
              either.fold(
                (failure) {
                  failure[1].maybeMap(
                    // Value failures

                    exceededPrice: (_) {
                      CustomSnackBar().showCustomSnackBar(
                        showContext: context,
                        headlineText:
                            AppLocalizations.of(context)!.priceLimitExceeded +
                                "!",
                        message: AppLocalizations.of(context)!
                                .theTeamYouHaveSelectedExceedsTheLimit +
                            " ${state.priceExceededBy.toStringAsFixed(1)}.",
                        snackBarType: "warning",
                      );
                    },

                    exceededTeamCount: (_) {
                      CustomSnackBar().showCustomSnackBar(
                        showContext: context,
                        headlineText:
                            AppLocalizations.of(context)!.playersFromTeam + "!",
                        message: AppLocalizations.of(context)!
                                .youHaveSelectedMoreThanPlayersFrom +
                            " ${state.countExceededTeam}.",
                        snackBarType: "warning",
                      );
                    },

                    deadlinePassed: (_) {
                      // ignore: avoid_print
                      print("deadlinePassed");
                    },

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
                    orElse: () {},
                  );
                },
                (_) {},
              );
            },
          );
        },
        builder: (context, state) {
          List allFormattedPlayers =
              getAllFormattedPlayers(userTeam: state.userTeam);

          final _transferBloc = getIt<TransferBloc>();
          return Scaffold(
            key: const Key("intialTransferViewMainKey"),
            body: SafeArea(
              child: SingleChildScrollView(
                key: const Key("initialTransferMainScrollKey"),
                child: Stack(
                  children: [
                    // Main Area
                    Container(
                      color: Colors.blue[50],
                      child: Column(
                        children: [
                          // TEAM TITLE
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 5,
                            ),
                            child: Center(
                              child: Text(
                                state.userTeam.teamName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.05,
                                    ),
                              ),
                            ),
                          ),

                          // BUDGET
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Center(
                              child: Text(
                                state.remainingInBank.toStringAsFixed(1),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.05,
                                      color: state.remainingInBank < 0
                                          ? Colors.red
                                          : Colors.green,
                                    ),
                              ),
                            ),
                          ),

                          // SPACER
                          const SizedBox(
                            height: 16,
                          ),

                          /*
                              =================================================
                              GOALKEEPERS
                              =================================================
                            */
                          Stack(
                            children: [
                              // SELECTION
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 50, 0, 10),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: allFormattedPlayers[0].length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      double playerPrice =
                                          allFormattedPlayers[0][index]
                                              .currentPrice
                                              .value
                                              .fold(
                                                (l) => 0.0,
                                                (r) => r,
                                              );
                                      return InkWell(
                                        key: const Key(
                                            "initialTransferViewGKKey"),
                                        onTap: () async {
                                          // set transfer out player
                                          _transferBloc.add(
                                            TransferEvent.setTransferOutPlayer(
                                              transferOutPlayerId: "",
                                              playerPosition:
                                                  PlayerPosition(value: "GK"),
                                            ),
                                          );

                                          // get all players in position
                                          _transferBloc.add(
                                            const TransferEvent
                                                .getPlayersInSelectedPosition(),
                                          );
                                          var efplCache = await Hive.openBox(
                                              'transferCache');
                                          List? allTeams =
                                              efplCache.get("allTeams");

                                          // if player already selected
                                          if (allFormattedPlayers[0][index]
                                                  .playerId !=
                                              "") {
                                            // remove current player
                                            _transferBloc.add(
                                              TransferEvent
                                                  .transferOutUserPlayerInitial(
                                                transferOutPlayerId:
                                                    allFormattedPlayers[0]
                                                            [index]
                                                        .playerId,
                                              ),
                                            );
                                          }

                                          // go to transfer page
                                          Navigator.pushNamed(
                                            context,
                                            "/transfer",
                                            arguments: {
                                              "allTeams": allTeams,
                                              "currentPlayerId": '',
                                              "isInitial": true,
                                            },
                                          );
                                        },
                                        child: SizedBox(
                                          width: 90,
                                          height: 80,
                                          child: PlayerWidget(
                                            key: Key(
                                              "initialTransferViewGKKey" +
                                                  (index + 1).toString(),
                                            ),
                                            playerName: allFormattedPlayers[0]
                                                    [index]
                                                .playerName
                                                .value
                                                .fold(
                                                  (l) => '',
                                                  (r) => r,
                                                ),
                                            description: playerPrice == 0
                                                ? ' '
                                                : playerPrice
                                                    .toStringAsFixed(1),
                                            teamName: allFormattedPlayers[0]
                                                            [index]
                                                        .eplTeamId
                                                        .value
                                                        .fold(
                                                          (l) => '  ',
                                                          (r) => r.toString(),
                                                        )
                                                        .toString() ==
                                                    "         "
                                                ? "shirt"
                                                : allFormattedPlayers[0][index]
                                                    .eplTeamId
                                                    .value
                                                    .fold(
                                                      (l) => '  ',
                                                      (r) => r.toString(),
                                                    ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),

                              // TITLE
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Center(
                                  child: Text(
                                    "GOALKEEPERS",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5,
                                          color: ConstantColors.primary_900
                                              .withOpacity(0.55),
                                        ),
                                  ),
                                ),
                              )
                            ],
                          ),

                          /*
                              =================================================
                              DEFENDERS
                              =================================================
                            */
                          Stack(
                            children: [
                              // SELECTION
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 50, 0, 10),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: allFormattedPlayers[1].length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      double playerPrice =
                                          allFormattedPlayers[1][index]
                                              .currentPrice
                                              .value
                                              .fold(
                                                (l) => 0.0,
                                                (r) => r,
                                              );
                                      return InkWell(
                                        onTap: () async {
                                          _transferBloc.add(
                                            TransferEvent.setTransferOutPlayer(
                                              transferOutPlayerId: "",
                                              playerPosition:
                                                  PlayerPosition(value: "DEF"),
                                            ),
                                          );

                                          _transferBloc.add(
                                            const TransferEvent
                                                .getPlayersInSelectedPosition(),
                                          );

                                          var efplCache = await Hive.openBox(
                                              'transferCache');
                                          List? allTeams =
                                              efplCache.get("allTeams");

                                          // if player already selected
                                          if (allFormattedPlayers[1][index]
                                                  .playerId !=
                                              "") {
                                            // remove current player
                                            _transferBloc.add(
                                              TransferEvent
                                                  .transferOutUserPlayerInitial(
                                                transferOutPlayerId:
                                                    allFormattedPlayers[1]
                                                            [index]
                                                        .playerId,
                                              ),
                                            );
                                          }

                                          Navigator.pushNamed(
                                            context,
                                            "/transfer",
                                            arguments: {
                                              "allTeams": allTeams,
                                              "currentPlayerId": '',
                                              "isInitial": true,
                                            },
                                          );
                                        },
                                        child: SizedBox(
                                          width: 80,
                                          child: PlayerWidget(
                                            key: Key(
                                              "initialTransferViewDEFKey" +
                                                  (index + 1).toString(),
                                            ),
                                            playerName: allFormattedPlayers[1]
                                                    [index]
                                                .playerName
                                                .value
                                                .fold(
                                                  (l) => '',
                                                  (r) => r,
                                                ),
                                            description: playerPrice == 0
                                                ? ' '
                                                : playerPrice
                                                    .toStringAsFixed(1),
                                            teamName: allFormattedPlayers[1]
                                                                [index]
                                                            .eplTeamId
                                                            .value
                                                            .fold(
                                                              (l) => '  ',
                                                              (r) =>
                                                                  r.toString(),
                                                            )
                                                            .toString() ==
                                                        "         " ||
                                                    allFormattedPlayers[1]
                                                            [index]
                                                        .eplTeamId
                                                        .value
                                                        .fold(
                                                          (l) => '  ',
                                                          (r) => r.toString(),
                                                        )
                                                        .toString()
                                                        .isEmpty
                                                ? "shirt"
                                                : allFormattedPlayers[1][index]
                                                    .eplTeamId
                                                    .value
                                                    .fold(
                                                      (l) => '  ',
                                                      (r) => r.toString(),
                                                    ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),

                              // TITLE
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Center(
                                  child: Text(
                                    "DEFENDERS",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5,
                                          color: ConstantColors.primary_900
                                              .withOpacity(0.55),
                                        ),
                                  ),
                                ),
                              )
                            ],
                          ),

                          /*
                              =================================================
                              MIDFIELDERS
                              =================================================
                            */
                          Stack(
                            children: [
                              // SELECTION
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 50, 0, 10),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: allFormattedPlayers[2].length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      double playerPrice =
                                          allFormattedPlayers[2][index]
                                              .currentPrice
                                              .value
                                              .fold(
                                                (l) => 0.0,
                                                (r) => r,
                                              );
                                      return InkWell(
                                        onTap: () async {
                                          _transferBloc.add(
                                            TransferEvent.setTransferOutPlayer(
                                              transferOutPlayerId: "",
                                              playerPosition:
                                                  PlayerPosition(value: "MID"),
                                            ),
                                          );

                                          _transferBloc.add(
                                            const TransferEvent
                                                .getPlayersInSelectedPosition(),
                                          );

                                          var efplCache = await Hive.openBox(
                                              'transferCache');
                                          List? allTeams =
                                              efplCache.get("allTeams");

                                          // if player already selected
                                          if (allFormattedPlayers[2][index]
                                                  .playerId !=
                                              "") {
                                            // remove current player
                                            _transferBloc.add(
                                              TransferEvent
                                                  .transferOutUserPlayerInitial(
                                                transferOutPlayerId:
                                                    allFormattedPlayers[2]
                                                            [index]
                                                        .playerId,
                                              ),
                                            );
                                          }

                                          Navigator.pushNamed(
                                            context,
                                            "/transfer",
                                            arguments: {
                                              "allTeams": allTeams,
                                              "currentPlayerId": '',
                                              "isInitial": true,
                                            },
                                          );
                                        },
                                        child: SizedBox(
                                          width: 80,
                                          child: PlayerWidget(
                                            key: Key(
                                              "initialTransferViewMIDKey" +
                                                  (index + 1).toString(),
                                            ),
                                            playerName: allFormattedPlayers[2]
                                                    [index]
                                                .playerName
                                                .value
                                                .fold(
                                                  (l) => '',
                                                  (r) => r,
                                                ),
                                            description: playerPrice == 0
                                                ? ' '
                                                : playerPrice
                                                    .toStringAsFixed(1),
                                            teamName: allFormattedPlayers[2]
                                                                [index]
                                                            .eplTeamId
                                                            .value
                                                            .fold(
                                                              (l) => '  ',
                                                              (r) =>
                                                                  r.toString(),
                                                            )
                                                            .toString() ==
                                                        "         " ||
                                                    allFormattedPlayers[2]
                                                            [index]
                                                        .eplTeamId
                                                        .value
                                                        .fold(
                                                          (l) => '  ',
                                                          (r) => r.toString(),
                                                        )
                                                        .toString()
                                                        .isEmpty
                                                ? "shirt"
                                                : allFormattedPlayers[2][index]
                                                    .eplTeamId
                                                    .value
                                                    .fold(
                                                      (l) => '  ',
                                                      (r) => r.toString(),
                                                    ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),

                              // TITLE
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Center(
                                  child: Text(
                                    "MIDFIELDERS",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5,
                                          color: ConstantColors.primary_900
                                              .withOpacity(0.55),
                                        ),
                                  ),
                                ),
                              )
                            ],
                          ),

                          /*
                              =================================================
                              ATTACKERS
                              =================================================
                            */
                          Stack(
                            children: [
                              // SELECTION
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 50, 0, 10),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: allFormattedPlayers[3].length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      double playerPrice =
                                          allFormattedPlayers[3][index]
                                              .currentPrice
                                              .value
                                              .fold(
                                                (l) => 0.0,
                                                (r) => r,
                                              );
                                      return InkWell(
                                        onTap: () async {
                                          _transferBloc.add(
                                            TransferEvent.setTransferOutPlayer(
                                              transferOutPlayerId: "",
                                              playerPosition:
                                                  PlayerPosition(value: "ATT"),
                                            ),
                                          );

                                          _transferBloc.add(
                                            const TransferEvent
                                                .getPlayersInSelectedPosition(),
                                          );

                                          var efplCache = await Hive.openBox(
                                              'transferCache');
                                          List? allTeams =
                                              efplCache.get("allTeams");

                                          // if player already selected
                                          if (allFormattedPlayers[3][index]
                                                  .playerId !=
                                              "") {
                                            // remove current player
                                            _transferBloc.add(
                                              TransferEvent
                                                  .transferOutUserPlayerInitial(
                                                transferOutPlayerId:
                                                    allFormattedPlayers[3]
                                                            [index]
                                                        .playerId,
                                              ),
                                            );
                                          }

                                          Navigator.pushNamed(
                                            context,
                                            "/transfer",
                                            arguments: {
                                              "allTeams": allTeams,
                                              "currentPlayerId": '',
                                              "isInitial": true,
                                            },
                                          );
                                        },
                                        child: SizedBox(
                                          width: 80,
                                          child: PlayerWidget(
                                            key: Key(
                                              "initialTransferViewATTKey" +
                                                  (index + 1).toString(),
                                            ),
                                            playerName: allFormattedPlayers[3]
                                                    [index]
                                                .playerName
                                                .value
                                                .fold(
                                                  (l) => '',
                                                  (r) => r,
                                                ),
                                            description: playerPrice == 0
                                                ? ' '
                                                : playerPrice
                                                    .toStringAsFixed(1),
                                            teamName: allFormattedPlayers[3]
                                                                [index]
                                                            .eplTeamId
                                                            .value
                                                            .fold(
                                                              (l) => '  ',
                                                              (r) =>
                                                                  r.toString(),
                                                            )
                                                            .toString() ==
                                                        "         " ||
                                                    allFormattedPlayers[3]
                                                            [index]
                                                        .eplTeamId
                                                        .value
                                                        .fold(
                                                          (l) => '  ',
                                                          (r) => r.toString(),
                                                        )
                                                        .toString()
                                                        .isEmpty
                                                ? "shirt"
                                                : allFormattedPlayers[3][index]
                                                    .eplTeamId
                                                    .value
                                                    .fold(
                                                      (l) => '  ',
                                                      (r) => r.toString(),
                                                    ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),

                              // TITLE
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Center(
                                  child: Text(
                                    "ATTACKERS",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5,
                                          color: ConstantColors.primary_900
                                              .withOpacity(0.55),
                                        ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    state.transfersMadeCount < 15
                        ? Container()
                        : Positioned(
                            child: InkWell(
                              key: const Key("initialTransferViewSaveKey"),
                              onTap: () async {
                                _transferBloc.add(
                                  TransferEvent.validateTeam(
                                    context: context,
                                  ),
                                );
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: ConstantColors.primary_900,
                                  border: Border.all(
                                    color: ConstantColors.primary_900,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ConstantColors.primary_900
                                          .withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                        0,
                                        3,
                                      ), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.save,
                                  color: ConstantColors.neutral_200,
                                ),
                              ),
                            ),
                            bottom: 15.0,
                            right: 15.0,
                          )
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

List getAllFormattedPlayers({required UserTeam userTeam}) {
  List<UserPlayer> allUserPlayers = userTeam.allUserPlayers;

  //
  List<UserPlayer> allGoalKeepers = [];
  List<UserPlayer> allDefender = [];
  List<UserPlayer> allMidfielders = [];
  List<UserPlayer> allAttackers = [];

  for (var userPlayer in allUserPlayers) {
    String position = userPlayer.playerPosition.value.fold(
      (l) => '',
      (r) => r,
    );

    if (position == "GK") {
      allGoalKeepers.add(userPlayer);
    } else if (position == "DEF") {
      allDefender.add(userPlayer);
    } else if (position == "MID") {
      allMidfielders.add(userPlayer);
    } else if (position == "ATT") {
      allAttackers.add(userPlayer);
    }
  }

  while (allGoalKeepers.length < 2) {
    allGoalKeepers.add(
      UserPlayer(
        playerId: '',
        playerName: PlayerName(value: '         '),
        currentPrice: PlayerPrice(value: 0),
        playerPosition: PlayerPosition(value: "GK"),
        eplTeamId: PlayerEplTeam(value: '         '),
        eplTeamLogo: '',
        multiplier: 0,
        isCaptain: false,
        isViceCaptain: false,
        availability: PlayerAvailability(
          value: const {"injuryStatus": "", "injuryMessage": ""},
        ),
        score: 0,
        upComingFixtures: [],
      ),
    );
  }

  while (allDefender.length < 5) {
    allDefender.add(
      UserPlayer(
        playerId: '',
        playerName: PlayerName(value: '         '),
        currentPrice: PlayerPrice(value: 0),
        playerPosition: PlayerPosition(value: "DEF"),
        eplTeamId: PlayerEplTeam(value: '         '),
        eplTeamLogo: '',
        multiplier: 0,
        isCaptain: false,
        isViceCaptain: false,
        availability: PlayerAvailability(
          value: const {"injuryStatus": "", "injuryMessage": ""},
        ),
        score: 0,
        upComingFixtures: [],
      ),
    );
  }

  while (allMidfielders.length < 5) {
    allMidfielders.add(
      UserPlayer(
        playerId: '',
        playerName: PlayerName(value: '         '),
        currentPrice: PlayerPrice(value: 0),
        playerPosition: PlayerPosition(value: "MID"),
        eplTeamId: PlayerEplTeam(value: ''),
        eplTeamLogo: '',
        multiplier: 0,
        isCaptain: false,
        isViceCaptain: false,
        availability: PlayerAvailability(
          value: const {"injuryStatus": "", "injuryMessage": ""},
        ),
        score: 0,
        upComingFixtures: [],
      ),
    );
  }

  while (allAttackers.length < 3) {
    allAttackers.add(
      UserPlayer(
        playerId: '',
        playerName: PlayerName(value: '         '),
        currentPrice: PlayerPrice(value: 0),
        playerPosition: PlayerPosition(value: "ATT"),
        eplTeamId: PlayerEplTeam(value: ''),
        eplTeamLogo: '',
        multiplier: 0,
        isCaptain: false,
        isViceCaptain: false,
        availability: PlayerAvailability(
          value: const {"injuryStatus": "", "injuryMessage": ""},
        ),
        score: 0,
        upComingFixtures: [],
      ),
    );
  }

  return [allGoalKeepers, allDefender, allMidfielders, allAttackers];
}
