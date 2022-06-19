import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/transfers/widgets/user_player_widget.dart';
import 'package:efpl/services/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransfersView extends StatelessWidget {
  const TransfersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get bloc
    final TransferBloc _transferBloc = getIt<TransferBloc>()
      ..add(
        const TransferEvent.getUserPlayers(),
      );

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _transferBloc,
        )
      ],
      child: BlocConsumer<TransferBloc, TransferState>(
        listener: (context, state) {
          state.valueFailureOrSuccess.fold(
            () {},
            (either) {
              either.fold(
                (failure) {
                  failure[1].maybeMap(
                    // Team Issues
                    noTeamSelected: (_) {
                      CustomSnackBar().showCustomSnackBar(
                        showContext: context,
                        headlineText:
                            AppLocalizations.of(context)!.noTeamSelected + "!",
                        message: AppLocalizations.of(context)!
                            .pleaseSelectYourInitialTeam,
                        snackBarType: "warning",
                      );

                      getIt<TransferBloc>().add(
                        const TransferEvent.setInitialSelection(
                          valueToSet: true,
                        ),
                      );

                      Navigator.popAndPushNamed(context, "/transfer/initial");
                    },

                    incompleteTeam: (_) {
                      CustomSnackBar().showCustomSnackBar(
                        showContext: context,
                        headlineText:
                            AppLocalizations.of(context)!.incompleteTeam + "!",
                        message: AppLocalizations.of(context)!
                            .theTeamYouHaveSelectedIsIncomplete,
                        snackBarType: "error",
                      );

                      getIt<TransferBloc>().add(
                        const TransferEvent.setInitialSelection(
                          valueToSet: true,
                        ),
                      );
                      // Navigator.popAndPushNamed(context, "/transfer/initial");
                    },
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
                      print("Deadline Passed");
                    },

                    // Auth Issues
                    // unauthenticated: (_) {
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
                    // unauthorized: (_) {
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

                    // Connection Issues
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
                    unexpectedError: (_) {
                      // CustomSnackBar().showCustomSnackBar(
                      //   showContext: context,
                      //   headlineText:
                      //       AppLocalizations.of(context)!.somethingWentWrong,
                      //   message:
                      //       AppLocalizations.of(context)!.somethingWentWrong +
                      //           "." +
                      //           AppLocalizations.of(context)!
                      //               .pleaseLoginAndTryAgain +
                      //           " !",
                      //   snackBarType: "warning",
                      // );
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
          // format players by position
          List allFormattedPlayers =
              getAllFormattedPlayers(userTeam: state.userTeam);

          // check if team is complete
          bool isTeamComplete = allFormattedPlayers[0].length != 0 &&
              allFormattedPlayers[1].length != 0 &&
              allFormattedPlayers[2].length != 0 &&
              allFormattedPlayers[3].length != 0;

          // PULL TO REFRESH
          return LiquidPullToRefresh(
            onRefresh: () async {
              _transferBloc.add(
                const TransferEvent.getUserPlayers(),
              );
            },
            height: 60,
            showChildOpacityTransition: false,
            color: ConstantColors.primary_900,
            animSpeedFactor: 2,
            child: Container(
              color: Colors.blue[50],
              child: state.isLoading
                  ? _buildLoaderView()
                  : Stack(
                      children: [
                        isTeamComplete == false
                            ?
                            // no team view
                            _buildNoTeamView()
                            :
                            // main team view
                            _buildTeamView(
                                state: state,
                                context: context,
                                allFormattedPlayers: allFormattedPlayers),

                        // buttons builder
                        _buildButtonsView(
                            context: context,
                            state: state,
                            transferBloc: _transferBloc),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}

// Show loader
Widget _buildLoaderView() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

// show not team info
Widget _buildNoTeamView() {
  return const Center(
    child: Text("No Team"),
  );
}

// show team info
Widget _buildTeamView(
    {required TransferState state,
    required BuildContext context,
    required List allFormattedPlayers}) {
  return SingleChildScrollView(
    child: SizedBox(
      child: Column(
        children: [
          // Spacer
          const SizedBox(
            height: 12,
          ),

          // HEADER INFO
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // TEAM NAME
              Text(
                state.userTeam.teamName,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ConstantColors.neutral_700),
              ),

              // SPACER
              const SizedBox(
                height: 4,
              ),

              // GAMEWEEK INFO
              Text(
                state.userTeam.gameWeekId.value.fold(
                  (l) => AppLocalizations.of(context)!.gameWeek + " 1",
                  (r) =>
                      AppLocalizations.of(context)!.gameWeek +
                      " " +
                      r.toString(),
                ),
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),

          // SPACER
          const SizedBox(
            height: 20,
          ),

          // GOAL KEEPERS
          _buildGKView(
            context: context,
            allFormattedPlayers: allFormattedPlayers,
          ),

          // DEFENDERS
          _buildDEFView(
            context: context,
            allFormattedPlayers: allFormattedPlayers,
          ),

          // MIDFIELDERS
          _buildMIDView(
            context: context,
            allFormattedPlayers: allFormattedPlayers,
          ),

          // ATTACKERS
          _buildATTView(
            context: context,
            allFormattedPlayers: allFormattedPlayers,
          ),

          // SPACER
          const SizedBox(
            height: 15,
          ),

          // MORE INFO
          _buildMoreInfoView(context: context, state: state)
        ],
      ),
    ),
  );
}

// show buttons
Widget _buildButtonsView(
    {required TransferState state,
    required TransferBloc transferBloc,
    required BuildContext context}) {
  return state.transfersMade == true
      ? Positioned(
          width: 120,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Save Button
              InkWell(
                key: const Key("transfersViewSaveButton"),
                onTap: () async {
                  transferBloc.add(
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
                    // border: Border.all(
                    //   color: ConstantColors.primary_900,
                    // ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: ConstantColors.primary_900.withOpacity(0.5),
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

              // Cancel Button
              InkWell(
                key: const Key("transfersViewCancelButton"),
                onTap: () {
                  transferBloc.add(
                    const TransferEvent.cancelTransfer(),
                  );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: ConstantColors.error_200,
                    border: Border.all(color: ConstantColors.error_200),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: ConstantColors.error_200.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.close,
                    color: ConstantColors.neutral_200,
                  ),
                ),
              ),
            ],
          ),
          bottom: 15.0,
          right: 15.0,
        )
      : Container();
}

Widget _buildGKView(
    {required BuildContext context, required List allFormattedPlayers}) {
  return Container(
    height: 140,
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.symmetric(
      horizontal: 120,
      vertical: 10,
    ),
    child: Stack(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemCount: allFormattedPlayers[0].length,
          itemBuilder: (context, index) {
            // USER PLAYER WIDGET
            return UserPlayerWidget(
              key: Key(
                "transferViewGKKey" + (index + 1).toString(),
              ),
              currentUserPlayer: allFormattedPlayers[0][index],
            );
          },
        ),
      ],
    ),
  );
}

Widget _buildDEFView(
    {required BuildContext context, required List allFormattedPlayers}) {
  return Container(
    height: 140,
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.symmetric(
      horizontal: 5,
      vertical: 10,
    ),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: allFormattedPlayers[1].length > 0
            ? allFormattedPlayers[1].length
            : 1,
        childAspectRatio: 0.75,
      ),
      itemCount: allFormattedPlayers[1].length,
      itemBuilder: (context, index) {
        return UserPlayerWidget(
          currentUserPlayer: allFormattedPlayers[1][index],
        );
      },
    ),
  );
}

Widget _buildMIDView(
    {required BuildContext context, required List allFormattedPlayers}) {
  return Container(
    height: 140,
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.symmetric(
      horizontal: 5,
      vertical: 10,
    ),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: allFormattedPlayers[2].length > 0
            ? allFormattedPlayers[2].length
            : 1,
        childAspectRatio: 0.75,
      ),
      itemCount: allFormattedPlayers[2].length,
      itemBuilder: (context, index) {
        return UserPlayerWidget(
          currentUserPlayer: allFormattedPlayers[2][index],
        );
      },
    ),
  );
}

Widget _buildATTView(
    {required BuildContext context, required List allFormattedPlayers}) {
  return Container(
    height: 140,
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.symmetric(
      horizontal: 85,
      vertical: 10,
    ),
    child: Center(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: allFormattedPlayers[3].length > 0
              ? allFormattedPlayers[3].length
              : 1,
          childAspectRatio: 0.75,
        ),
        itemCount: allFormattedPlayers[3].length,
        itemBuilder: (context, index) {
          return UserPlayerWidget(
            currentUserPlayer: allFormattedPlayers[3][index],
          );
        },
      ),
    ),
  );
}

Widget _buildMoreInfoView(
    {required BuildContext context, required TransferState state}) {
  return Container(
    height: 160,
    padding: const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 5,
    ),
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Bank
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: Row(
            children: [
              // Label
              Text(
                AppLocalizations.of(context)!.bank + " : ",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 18,
                      color: ConstantColors.primary_900,
                    ),
              ),
              Text(
                state.remainingInBank.toStringAsFixed(1),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: state.remainingInBank < 0.0
                          ? ConstantColors.error_300
                          : Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),

        // Deduction
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            children: [
              // Label
              Text(
                AppLocalizations.of(context)!.deduction + " : ",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 18,
                      color: ConstantColors.primary_900,
                    ),
              ),
              Text(
                (state.userTeam.deduction * -1).toString(),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: state.userTeam.deduction * -1 < 0.0
                          ? ConstantColors.error_300
                          : Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
        ),

        // Free Transfers
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.freeTransfers + " : ",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 18,
                      color: ConstantColors.primary_900,
                    ),
              ),
              Text(
                state.userTeam.freeTransfers.toString(),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: state.userTeam.freeTransfers < 1
                          ? ConstantColors.error_300
                          : Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
        ),

        // Deadline
        // Container(
        //   width: MediaQuery.of(context).size.width * 0.65,
        //   padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        //   child: Row(
        //     children: [
        //       Text(
        //         AppLocalizations.of(context)!.deadline + " : ",
        //         style: Theme.of(context).textTheme.bodyText1?.copyWith(
        //               fontSize: 18,
        //               color: ConstantColors.primary_900,
        //             ),
        //       ),
        //       Text(
        //         formatDeadline(state.userTeam.gameWeekDeadline),
        //         style: Theme.of(context).textTheme.bodyText1!.copyWith(
        //               fontSize: 18,
        //               color: ConstantColors.primary_900,
        //             ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    ),
  );
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

  return [allGoalKeepers, allDefender, allMidfielders, allAttackers];
}

String formatDeadline(String deadline) {
  DateTime dt = DateTime.fromMillisecondsSinceEpoch(int.parse(deadline));

  const weekDays = ['Mon', "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  const months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  final String formattedDate = weekDays[dt.weekday - 1].toString() +
      " " +
      months[dt.month - 1] +
      ", " +
      dt.day.toString() +
      " " +
      dt.year.toString();

  return formattedDate;
  // return "";
}
