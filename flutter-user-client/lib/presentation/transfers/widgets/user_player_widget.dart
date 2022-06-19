import 'package:cached_network_image/cached_network_image.dart';
import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserPlayerWidget extends StatelessWidget {
  final UserPlayer currentUserPlayer;
  const UserPlayerWidget({
    Key? key,
    required this.currentUserPlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String injuryStatus = currentUserPlayer.availability.value.fold(
      (l) => '',
      (r) => r['injuryStatus'].toString(),
    );

    final String teamName = currentUserPlayer.eplTeamId.value
        .fold((l) => "shirt", (r) => r.toString());

    return BlocBuilder<TransferBloc, TransferState>(
      builder: (context, state) {
        TransferBloc _transferBloc = getIt<TransferBloc>();

        return InkWell(
          onTap: () {
            _buildModalSheet(
                context: context,
                currentUserPlayer: currentUserPlayer,
                transferBloc: _transferBloc);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: state.transferredInPlayerIdList
                      .contains(currentUserPlayer.playerId)
                  ? Colors.amber[800]
                  : Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      // SHIRT
                      _buildShirtView(teamName: teamName),

                      // INJURY STATUS
                      _buildInjuryView(
                        context: context,
                        injuryStatus: injuryStatus,
                      ),

                      //CAPTAIN & VICE STATUS
                      _buildCaptainView(
                        context: context,
                        isCaptain: currentUserPlayer.isCaptain,
                        isViceCaptain: currentUserPlayer.isViceCaptain,
                      )
                    ],
                  ),

                  // PLAYER NAME
                  _buildPlayerNameView(
                    context: context,
                    currentUserPlayer: currentUserPlayer,
                  ),

                  // PLAYER PRICE
                  _buildPlayerPriceView(
                    currentUserPlayer: currentUserPlayer,
                    context: context,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void _buildModalSheet(
    {required BuildContext context,
    required UserPlayer currentUserPlayer,
    required TransferBloc transferBloc}) {
  // base url
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
              height: 370,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 8,
              ),
              child: Column(
                children: [
                  // Player Name
                  Text(
                    currentUserPlayer.playerName.value
                        .fold((l) => '', (r) => r),
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
                        currentUserPlayer.eplTeamId.value
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
                          arguments: int.parse(currentUserPlayer.playerId));
                    },
                    child: SizedBox(
                      height: 38,
                      child: Row(
                        children: [
                          Container(
                            child: const Icon(
                              Icons.info,
                              color: ConstantColors.primary_900,
                            ),
                            margin: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                          ),
                          Text(
                            AppLocalizations.of(context)!.playerInformation,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 15,
                                    ),
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
                    key: const Key("transferViewModalTransferButton"),
                    onTap: () {
                      state.transferredInPlayerIdList
                              .contains(currentUserPlayer.playerId)
                          ? cancelOnePlayerTransfer(
                              transferBloc, currentUserPlayer, context)
                          : transferPlayer(
                              transferBloc, currentUserPlayer, context);
                    },
                    child: SizedBox(
                      height: 38,
                      child: Row(
                        children: [
                          Container(
                            child: const Icon(
                              Boxicons.bx_transfer,
                              color: ConstantColors.primary_900,
                            ),
                            margin: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                          ),
                          state.transferredInPlayerIdList
                                  .contains(currentUserPlayer.playerId)
                              ? Text(
                                  AppLocalizations.of(context)!.cancelTransfers,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 15,
                                      ),
                                )
                              : Text(
                                  AppLocalizations.of(context)!.transfer,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 15,
                                      ),
                                )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
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
                    height: 16,
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
                                  // imageUrl:

                                  imageUrl: _baseURL +
                                      currentUserPlayer.upComingFixtures[index]
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
                                    currentUserPlayer.upComingFixtures[index]
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
                                          currentUserPlayer
                                              .upComingFixtures[index],
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

Widget _buildShirtView({required String teamName}) {
  return Center(
    child: Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        "assets/jerseys/" + teamName + ".png",
        width: 50,
        height: 50,
      ),
    ),
  );
}

Widget _buildInjuryView(
    {required String injuryStatus, required BuildContext context}) {
  return injuryStatus == '' || injuryStatus == 'none'
      ? Container()
      : Positioned(
          top: 5,
          left: 10,
          child: Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              color: int.parse(injuryStatus.toString()) >= 50
                  ? Colors.amber
                  : Colors.red,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                injuryStatus,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                      color: int.parse(injuryStatus.toString()) >= 50
                          ? Colors.black
                          : Colors.white,
                    ),
              ),
            ),
          ),
        );
}

Widget _buildCaptainView(
    {required bool isCaptain,
    required bool isViceCaptain,
    required BuildContext context}) {
  return isCaptain == false && isViceCaptain == false
      ? Container()
      : Positioned(
          bottom: 5,
          right: 10,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.blue[400],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                isCaptain ? "C" : "V",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        );
}

Widget _buildPlayerPriceView(
    {required UserPlayer currentUserPlayer, required BuildContext context}) {
  return SizedBox(
    height: 15,
    width: 70,
    child: Center(
      child: Text(
        currentUserPlayer.currentPrice.value.fold(
          (l) => '',
          (r) => r.toString(),
          // currentUserPlayer.multiplier.toString(),
        ),
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: ConstantColors.primary_900,
            ),
      ),
    ),
  );
}

Widget _buildPlayerNameView(
    {required UserPlayer currentUserPlayer, required BuildContext context}) {
  return Container(
    width: 70,
    height: 16,
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: Center(
      child: Text(
        currentUserPlayer.playerName.value.fold(
          (l) => '',
          (r) => r.split(" ")[0],
        ),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: ConstantColors.primary_900,
              fontSize: 14,
            ),
      ),
    ),
  );
}

Future<void> transferPlayer(_transferBloc, currentUserPlayer, context) async {
  // Set player position
  _transferBloc.add(
    TransferEvent.setTransferOutPlayer(
      transferOutPlayerId: currentUserPlayer.playerId,
      playerPosition: currentUserPlayer.playerPosition,
    ),
  );

  // get all players in position
  _transferBloc.add(
    const TransferEvent.getPlayersInSelectedPosition(),
  );

  var efplCache = await Hive.openBox('transferCache');
  List? allTeams = efplCache.get("allTeams");

  Navigator.pop(context);

  Navigator.pushNamed(
    context,
    "/transfer",
    arguments: {
      "allTeams": allTeams,
      "currentPlayerId": currentUserPlayer.playerId,
      "isInitial": false,
    },
  );
}

void cancelOnePlayerTransfer(_transferBloc, currentUserPlayer, context) {
  _transferBloc.add(
    TransferEvent.cancelOneTransfer(
        playerToCancelId: currentUserPlayer.playerId),
  );

  Navigator.pop(context);
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

int isHomeTeam(Map fixtureTeam) {
  int isHomeValue = 0;

  if (fixtureTeam['teamInfo'].split("+-").last == "H") {
    isHomeValue = 1;
  }

  return isHomeValue;
}
