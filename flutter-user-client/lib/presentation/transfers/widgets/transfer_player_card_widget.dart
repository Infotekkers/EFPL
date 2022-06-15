import 'package:cached_network_image/cached_network_image.dart';
import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/application/watch_list/watch_list_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserPlayerCard extends StatelessWidget {
  final UserPlayer currentPlayer;
  final bool isInitial;
  const UserPlayerCard({
    Key? key,
    required this.currentPlayer,
    required this.isInitial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final _transferBloc = getIt<TransferBloc>();
    final String _baseURL = dotenv.env["API"].toString();

    final String injuryStatus = currentPlayer.availability.value
        .fold((l) => '', (r) => r['injuryStatus'].toString());

    return InkWell(
      onTap: () {
        _buildModalSheet(
          context: context,
          currentPlayer: currentPlayer,
          isInitial: isInitial,
        );
      },
      child: _buildPlayerCard(
        baseURL: _baseURL,
        context: context,
        currentPlayer: currentPlayer,
        injuryStatus: injuryStatus,
      ),
    );
  }
}

void _buildModalSheet(
    {required BuildContext context,
    required UserPlayer currentPlayer,
    required bool isInitial}) {
  final String _baseURL = dotenv.env["API"].toString();
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
    ),
    builder: (builder) {
      return BlocProvider.value(
        value: getIt<TransferBloc>(),
        child: BlocBuilder<TransferBloc, TransferState>(
          builder: (context, state) {
            return Container(
              height: 375,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 8,
              ),
              child: Column(
                children: [
                  // Player Name
                  Text(
                    currentPlayer.playerName.value.fold((l) => '', (r) => r),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.25,
                        ),
                  ),

                  const SizedBox(
                    height: 2,
                  ),

                  Text(
                    " ( " +
                        currentPlayer.eplTeamId.value
                            .fold((l) => '', (r) => r) +
                        " )",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 12,
                          letterSpacing: 0.05,
                        ),
                  ),

                  // Spacer
                  const SizedBox(
                    height: 16,
                  ),

                  // Player Information Button
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/player",
                          arguments: int.parse(currentPlayer.playerId));
                    },
                    child: SizedBox(
                      height: 38,
                      child: Row(
                        children: [
                          Container(
                            child: const Icon(Icons.info),
                            margin: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                          ),
                          Text(
                            AppLocalizations.of(context)!.playerInformation,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 2,
                  ),

                  // Transfer
                  InkWell(
                    key: const Key("transferPlayerCardTransferButton"),
                    onTap: () {
                      if (isInitial) {
                        getIt<TransferBloc>().add(
                          TransferEvent.transferUserPlayerInitial(
                            transferInPlayerId: currentPlayer.playerId,
                          ),
                        );
                      } else {
                        getIt<TransferBloc>().add(
                          TransferEvent.transferUserPlayer(
                            transferInPlayerId: currentPlayer.playerId,
                          ),
                        );
                      }
                      Navigator.pop(context);

                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: 38,
                      child: Row(
                        children: [
                          Container(
                            child: const Icon(Boxicons.bx_transfer),
                            margin: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                          ),
                          state.transferredInPlayerIdList
                                  .contains(currentPlayer.playerId)
                              ? Text(
                                  AppLocalizations.of(context)!.cancelTransfers,
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              : Text(
                                  AppLocalizations.of(context)!.transfer,
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 2,
                  ),

                  // Add To WatchList
                  InkWell(
                    onTap: () {
                      getIt<WatchListBloc>().add(
                        WatchListEvent.addToUserWatchList(
                            playerId: currentPlayer.playerId),
                      );
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: 38,
                      child: Row(
                        children: [
                          Container(
                            child: const Icon(Boxicons.bxs_binoculars),
                            margin: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                          ),
                          Text(
                            AppLocalizations.of(context)!.addToWatchList,
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  Text(
                    AppLocalizations.of(context)!.upcomingFixtures,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.25,
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                          width: 80,
                          // color: Colors.amber,
                          child: Column(
                            children: [
                              // Team Icon
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: _baseURL +
                                      currentPlayer.upComingFixtures[index]
                                          ['teamLogo'],
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                ),
                              ),

                              // SPACER
                              const SizedBox(
                                height: 8,
                              ),

                              // Team Name
                              SizedBox(
                                height: 15,
                                width: 80,
                                // color: Colors.green,
                                child: Text(
                                  getFixtureTeamAcronym(
                                    currentPlayer.upComingFixtures[index]
                                        ['teamInfo'],
                                  ),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.35,
                                      ),
                                ),
                              ),

                              const SizedBox(
                                height: 2,
                              ),

                              // Match Rate
                              Container(
                                height: 5,
                                width: 80,
                                color: isHomeTeam(
                                          currentPlayer.upComingFixtures[index]
                                              ['teamInfo'],
                                        ) ==
                                        1
                                    ? ConstantColors.success_300
                                    : ConstantColors.error_300,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

Widget _buildPlayerCard(
    {required BuildContext context,
    required String baseURL,
    required UserPlayer currentPlayer,
    required String injuryStatus}) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: 0.5,
          color: ConstantColors.primary_900.withOpacity(0.65),
        ),
      ),
    ),
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Player Name Logo
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.55,
          child: Row(
            children: [
              Container(
                  width: 50,
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Stack(
                    children: [
                      // CLUB ICON
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: CachedNetworkImage(
                          imageUrl: baseURL + currentPlayer.eplTeamLogo,
                        ),
                      ),

                      // INJURY STATUS
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: injuryStatus.isEmpty
                              ? const BoxDecoration()
                              : BoxDecoration(
                                  color: int.parse(injuryStatus) < 50
                                      ? Colors.red
                                      : Colors.amber,
                                  shape: BoxShape.circle,
                                ),
                          child: injuryStatus.isEmpty
                              ? Container()
                              : Center(
                                  child: Text(
                                    "75",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                        ),
                      )
                    ],
                  )),

              // PLAYER NAME
              SizedBox(
                width: (MediaQuery.of(context).size.width * 0.55) - 55,
                height: 45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                      child: Text(
                        currentPlayer.playerName.value.fold(
                          (l) => '',
                          (r) => r,
                        ),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w100,
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ),

                    // SPACER
                    const SizedBox(
                      height: 5,
                    ),

                    // PLAYER POSITION
                    SizedBox(
                      height: 13,
                      child: Text(
                        currentPlayer.playerPosition.value
                                .fold((l) => '', (r) => r) +
                            " / " +
                            currentPlayer.eplTeamId.value.fold(
                              (l) => '',
                              (r) => r,
                            ),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 10,
                            ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        // Price
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.17,
          child: Center(
            child: Text(
              currentPlayer.currentPrice.value.fold(
                (l) => '',
                (r) => r.toString(),
              ),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                  ),
              textAlign: TextAlign.start,
            ),
          ),
        ),

        // POINTS
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.18,
          child: Center(
            child: Text(
              currentPlayer.score.toString(),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                  ),
              textAlign: TextAlign.start,
            ),
          ),
        )
      ],
    ),
  );
}

String getFixtureTeamAcronym(String fixtureTeam) {
  List nameList = fixtureTeam.split(" ");
  String acronym = "";

  nameList.length == 1
      ? acronym = acronym +
          nameList[0].split("")[0] +
          nameList[0].split("")[1] +
          nameList[0].split("")[2] +
          " ( " +
          fixtureTeam.split("+-")[1] +
          " ) "
      : nameList.length == 2
          ? acronym = acronym +
              nameList[0].split("")[0] +
              nameList[0].split("")[1] +
              nameList[1].split("")[0] +
              " ( " +
              fixtureTeam.split("+-")[1] +
              " ) "
          : acronym = acronym +
              nameList[0].split("")[0] +
              nameList[1].split("")[0] +
              nameList[2].split("")[0] +
              " ( " +
              fixtureTeam.split("+-")[1] +
              " ) ";
  return acronym;
}

int isHomeTeam(String fixtureTeam) {
  int isHomeValue = 0;

  if (fixtureTeam.split("+-").last == "H") {
    isHomeValue = 1;
  }

  return isHomeValue;
}
