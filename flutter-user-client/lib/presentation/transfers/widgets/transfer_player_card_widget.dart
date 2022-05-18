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
  const UserPlayerCard({Key? key, required this.currentPlayer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final _transferBloc = getIt<TransferBloc>();
    final String _baseURL = dotenv.env["BASE_URL"].toString();

    final String injuryStatus = currentPlayer.availability.value
        .fold((l) => '', (r) => r['injuryStatus'].toString());

    return InkWell(
      onTap: () {
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
              child: BlocConsumer<TransferBloc, TransferState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
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
                          currentPlayer.playerName.value
                              .fold((l) => '', (r) => r),
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
                            print("Player Information");
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
                            getIt<TransferBloc>().add(
                              TransferEvent.transferUserPlayer(
                                transferInPlayerId: currentPlayer.playerId,
                              ),
                            );

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
                                            currentPlayer
                                                .upComingFixtures[index],
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
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
            width: 0.75,
            color: Colors.black,
          )),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Player Name Logo
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Row(
                children: [
                  // Icon
                  Container(
                      width: 50,
                      height: 60,
                      margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 45,
                            height: 45,
                            child: CachedNetworkImage(
                              imageUrl: _baseURL + currentPlayer.eplTeamLogo,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: injuryStatus.isEmpty
                                  ? const BoxDecoration()
                                  : BoxDecoration(
                                      color: int.parse(injuryStatus) < 50
                                          ? ConstantColors.error_200
                                          : ConstantColors.warning_200,
                                      shape: BoxShape.circle,
                                    ),
                              child: injuryStatus.isEmpty
                                  ? Container()
                                  : const Center(
                                      child: Text(
                                        "75%",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                            ),
                          )
                        ],
                      )),

                  // Name
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
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: "Architect",
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
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
                            style: const TextStyle(
                                fontSize: 12, fontFamily: "Architect"),
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
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),

            // Total Points
            // Price
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.18,
              child: Center(
                child: Text(
                  currentPlayer.score.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
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
