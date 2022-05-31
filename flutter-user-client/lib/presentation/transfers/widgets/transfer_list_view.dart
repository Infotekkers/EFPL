import 'package:cached_network_image/cached_network_image.dart';
import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/transfers/widgets/transfer_player_card_widget.dart';
import 'package:efpl/services/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransferPlayerView extends StatelessWidget {
  const TransferPlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _baseURL = dotenv.env["API"].toString();
    final TransferBloc _transferBloc = getIt<TransferBloc>();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _transferBloc,
        ),
      ],
      child: BlocConsumer<TransferBloc, TransferState>(
        listener: (context, state) {
          state.valueFailureOrSuccess.fold(
            () {},
            (either) {
              either.fold(
                (failure) {
                  failure[1].maybeMap(
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
                    unauthorized: (_) {
                      CustomSnackBar().showCustomSnackBar(
                        showContext: context,
                        headlineText:
                            AppLocalizations.of(context)!.pleaseLogin + "!",
                        message: AppLocalizations.of(context)!.couldNotVerify +
                            "." +
                            AppLocalizations.of(context)!
                                .pleaseLoginAndTryAgain +
                            " !",
                        snackBarType: "warning",
                      );
                    },
                    unauthenticated: (_) {
                      CustomSnackBar().showCustomSnackBar(
                        showContext: context,
                        headlineText:
                            AppLocalizations.of(context)!.pleaseLogin + " !",
                        message: AppLocalizations.of(context)!.couldNotVerify +
                            "." +
                            AppLocalizations.of(context)!
                                .pleaseLoginAndTryAgain +
                            " !",
                        snackBarType: "warning",
                      );
                    },
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

                    // Value failures

                    orElse: () {
                      CustomSnackBar().showCustomSnackBar(
                        showContext: context,
                        headlineText: "Something went wrong.",
                        message: "Something went wrong. Try again!",
                        snackBarType: "error",
                      );
                    },
                  );
                },
                (_) {},
              );
            },
          );
        },
        builder: (context, state) {
          List<UserPlayer> allPositionPlayers =
              state.filteredSelectedPlayerReplacements;
          List<UserPlayer> userPlayers = state.userTeam.allUserPlayers;
          // remove players in user team from list
          List<UserPlayer> allPositionPlayerFiltered = [];
          for (var i = 0; i < allPositionPlayers.length; i++) {
            List checkPlayer = userPlayers
                .where((element) =>
                    element.playerId == allPositionPlayers[i].playerId)
                .toList();

            if (checkPlayer.isEmpty) {
              allPositionPlayerFiltered.add(allPositionPlayers[i]);
            }
          }
          // get args
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          String currentTransferredPlayerId = args['currentPlayerId'];
          bool isInitial = args['isInitial'];
          List currentPlayerFilter = state.selectedPlayerReplacements
              .where((player) =>
                  player.playerId.toString() == currentTransferredPlayerId)
              .toList();
          double currentPlayerPrice = 0.0;
          if (currentPlayerFilter.isNotEmpty) {
            UserPlayer currentPlayer = currentPlayerFilter[0];
            currentPlayerPrice = currentPlayerPrice +
                currentPlayer.currentPrice.value.fold((l) => 0.0, (r) => r);
          }
          List allTeams = args['allTeams'];
          List<String> allTeamsNames = ["Select a Team"];
          for (var team in allTeams) {
            allTeamsNames.add(team['teamName']);
          }
          SfRangeValues _values =
              SfRangeValues(state.minPriceSet, state.maxPriceSet);

          return Scaffold(
            appBar: _buildAppBar(
                context: context,
                state: state,
                currentPlayerPrice: currentPlayerPrice),
            body: Container(
              color: Colors.blue[50],
              child: state.isLoading
                  ? _buildLoadingView()
                  : allPositionPlayerFiltered.isEmpty
                      ? _buildNoPlayersView()
                      : _buildPlayersListView(
                          allPositionPlayerFiltered: allPositionPlayerFiltered,
                          context: context,
                          state: state,
                          transferBloc: _transferBloc,
                          allTeams: allTeams,
                          allTeamsNames: allTeamsNames,
                          values: _values,
                          baseURL: _baseURL,
                          isInitial: isInitial,
                        ),
            ),
          );
        },
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar(
    {required BuildContext context,
    required TransferState state,
    required num currentPlayerPrice}) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 80,
    backgroundColor: Colors.blue[50],
    foregroundColor: ConstantColors.primary_900,
    title: Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TITLE
          Text(
            AppLocalizations.of(context)!.transferList,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.25,
                ),
          ),

          // BANK INFO
          Column(
            children: [
              Text(
                AppLocalizations.of(context)!.bank,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                    ),
              ),

              // SPACER
              const SizedBox(height: 0.25),

              // PRICE INFO
              Text(
                (state.remainingInBank + currentPlayerPrice).toStringAsFixed(1),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color:
                          state.remainingInBank > 0 ? Colors.green : Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildLoadingView() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget _buildNoPlayersView() {
  return const Center(
    child: Text(
      "No Players",
    ),
  );
}

Widget _buildPlayersListView({
  required BuildContext context,
  required TransferState state,
  required TransferBloc transferBloc,
  required List allTeams,
  required String baseURL,
  required List<String> allTeamsNames,
  required List allPositionPlayerFiltered,
  required SfRangeValues values,
  required bool isInitial,
}) {
  return SingleChildScrollView(
    child: Center(
      child: Column(
        children: [
          // FILTER SECTION
          Column(
            children: [
              // TOP FILTERS
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    // Filter One (Team)
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        width: (MediaQuery.of(context).size.width * 0.58) - 20,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ConstantColors.primary_900,
                            width: 1.0,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: state.selectedDropDownTeamValue,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: ConstantColors.primary_900,
                                    ),
                            onChanged: (String? newTeamName) {
                              transferBloc.add(
                                TransferEvent.setFilter(
                                  filterBy: "team",
                                  filterValue: newTeamName!,
                                ),
                              );
                            },
                            items: allTeamsNames.map((String teamName) {
                              String finalURL = baseURL;

                              List teamLogoList = allTeams
                                  .where((team) => team['teamName'] == teamName)
                                  .toList();

                              if (teamLogoList.isNotEmpty) {
                                finalURL =
                                    finalURL + teamLogoList[0]['teamLogo'];
                              }

                              // TEAM FILTER DROP DOWN
                              return DropdownMenuItem<String>(
                                value: teamName,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 25,
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                      child: CachedNetworkImage(
                                        imageUrl: finalURL == baseURL
                                            ? '$baseURL/uploads/teams/placeholder_team.png'
                                            : finalURL,
                                      ),
                                    ),
                                    Text(
                                      teamName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontSize: 13,
                                          ),
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),

                    // Filter Two (Injury)
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        width: (MediaQuery.of(context).size.width * 0.42) - 20,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ConstantColors.primary_900,
                            width: 1.0,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: state.selectedDropDownInjuryStatusValue,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: ConstantColors.primary_900,
                                    ),
                            onChanged: (String? injuryStatus) {
                              transferBloc.add(
                                TransferEvent.setFilter(
                                  filterBy: "injury status",
                                  filterValue: injuryStatus!,
                                ),
                              );
                            },
                            items: <String>["All", "Available", "Unavailable"]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom Filter
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    // MIN LABEL
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.minimumPrice,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 13,
                                    ),
                          ),
                          Text(
                            state.minPriceSet.toStringAsFixed(1),
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                          )
                        ],
                      ),
                    ),

                    // SLIDER
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.76,
                      child: SfRangeSlider(
                        min: 3.5,
                        max: 15.0,
                        values: values,
                        interval: 0.1,
                        activeColor: ConstantColors.primary_900,
                        inactiveColor: ConstantColors.primary_400,
                        onChangeEnd: (SfRangeValues value) {
                          transferBloc.add(
                            const TransferEvent.filterByPrice(),
                          );
                        },
                        onChanged: (SfRangeValues value) {
                          transferBloc.add(
                            TransferEvent.setPriceFilter(
                              minValue: value.start,
                              maxValue: value.end,
                            ),
                          );
                        },
                      ),
                    ),

                    // MAX LABEL
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.maximumPrice,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 13,
                                    ),
                          ),
                          Text(
                            state.maxPriceSet.toStringAsFixed(1),
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

          // HEADER
          Container(
            height: 45,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: ConstantColors.primary_900,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // PLAYER NAME
                InkWell(
                  onTap: () {
                    transferBloc.add(
                      const TransferEvent.setSortFilter(
                        sortBy: 'name',
                      ),
                    );
                  },
                  child: SizedBox(
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.player,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 16,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                    color: ConstantColors.neutral_200,
                                  ),
                        ),
                        state.playerNameCurrentSortOrder == ""
                            ? const SizedBox(
                                height: 0,
                                width: 0,
                              )
                            : state.playerNameCurrentSortOrder == "a"
                                ? const Icon(
                                    Icons.arrow_drop_up,
                                    size: 25,
                                    color: ConstantColors.success_300,
                                  )
                                : const Icon(
                                    Icons.arrow_drop_down,
                                    size: 25,
                                    color: ConstantColors.error_300,
                                  ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.55,
                  ),
                ),

                // PLAYER PRICE
                InkWell(
                  onTap: () {
                    transferBloc.add(
                      const TransferEvent.setSortFilter(
                        sortBy: 'price',
                      ),
                    );
                  },
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.price,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 16,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                    color: ConstantColors.neutral_200,
                                  ),
                        ),
                        state.playerPriceCurrentSortOrder == ""
                            ? const SizedBox(
                                height: 0,
                                width: 0,
                              )
                            : state.playerPriceCurrentSortOrder == "a"
                                ? const Icon(
                                    Icons.arrow_drop_up,
                                    size: 25,
                                    color: ConstantColors.success_300,
                                  )
                                : const Icon(
                                    Icons.arrow_drop_down,
                                    size: 25,
                                    color: ConstantColors.error_300,
                                  ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.17,
                  ),
                ),

                // PLAYER POINT
                InkWell(
                  onTap: () {
                    transferBloc.add(
                      const TransferEvent.setSortFilter(
                        sortBy: 'point',
                      ),
                    );
                  },
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.points,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 16,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                    color: ConstantColors.neutral_200,
                                  ),
                        ),
                        state.playerScoreCurrentSortOrder == ""
                            ? const SizedBox(
                                height: 0,
                                width: 0,
                              )
                            : state.playerScoreCurrentSortOrder == "a"
                                ? const Icon(
                                    Icons.arrow_drop_up,
                                    size: 25,
                                    color: ConstantColors.success_300,
                                  )
                                : const Icon(
                                    Icons.arrow_drop_down,
                                    size: 25,
                                    color: ConstantColors.error_300,
                                  ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.19,
                  ),
                )
              ],
            ),
          ),

          // PLAYERS LIST
          ListView.builder(
            itemCount: allPositionPlayerFiltered.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              // USER PLAYER CARD
              return UserPlayerCard(
                currentPlayer: allPositionPlayerFiltered[index],
                isInitial: isInitial,
              );
            },
          ),
        ],
      ),
    ),
  );
}
