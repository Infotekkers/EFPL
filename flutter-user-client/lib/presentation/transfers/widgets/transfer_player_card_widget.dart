import 'package:cached_network_image/cached_network_image.dart';
import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
    final String _baseURL = dotenv.env["BASE_URL"].toString();

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
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
    ),
    context: context,
    builder: (builder) {
      return BlocProvider.value(
        value: getIt<TransferBloc>(),
        child: BlocBuilder<TransferBloc, TransferState>(
          builder: (context, state) {
            return Container(
              height: 235,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 8,
              ),
              child: Column(
                children: [
                  // Player Name
                  Text(
                    currentPlayer.playerName.value.fold((l) => '', (r) => r),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Architect",
                      letterSpacing: 0.25,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Player Information Button
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed("/player",
                          arguments: int.parse(currentPlayer.playerId));
                    },
                    child: Row(
                      children: [
                        Container(
                          child: const Icon(Icons.info),
                          margin: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                        ),
                        const Text("Player Information"),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Transfer
                  InkWell(
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
                    child: Row(
                      children: [
                        Container(
                          child: const Icon(Boxicons.bx_transfer),
                          margin: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                        ),
                        const Text("Transfer"),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // Upcoming Fixtures
                  const Text(
                    "Upcoming Fixtures",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Architect",
                      letterSpacing: 0.25,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        childAspectRatio: 2.8,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 40,
                          height: 28,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ConstantColors.primary_900,
                              width: 0.55,
                            ),
                            color: isHomeTeam(
                                      currentPlayer.upComingFixtures[index],
                                    ) ==
                                    1
                                ? ConstantColors.success_300
                                : ConstantColors.error_300,
                          ),
                          child: Center(
                            child: Text(
                              getFixtureTeamAcronym(
                                currentPlayer.upComingFixtures[index],
                              ),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                      height: 20,
                      child: Text(
                        currentPlayer.playerName.value.fold(
                          (l) => '',
                          (r) => r,
                        ),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 18,
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
                      height: 15,
                      child: Text(
                        currentPlayer.playerPosition.value
                                .fold((l) => '', (r) => r) +
                            " / " +
                            currentPlayer.eplTeamId.value.fold(
                              (l) => '',
                              (r) => r,
                            ),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 12,
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
