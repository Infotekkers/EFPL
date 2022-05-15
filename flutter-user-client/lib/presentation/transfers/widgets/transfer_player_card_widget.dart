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
    final _transferBloc = getIt<TransferBloc>();
    final String _baseURL = dotenv.env["BASE_URL"].toString();

    final String injuryStatus = currentPlayer.availability.value
        .fold((l) => '', (r) => r['injuryStatus'].toString());

    return InkWell(
      onTap: () {
        showModalBottomSheet(
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
                    height: 200,
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    color: Colors.amber,
                    child: Column(
                      children: [
                        Text(state.selectedPlayerPosition.toString()),
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
                            color: Colors.white,
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

                        // TODO:ADD
                        const Text(
                          "Upcoming Fixtures",
                          style: TextStyle(fontSize: 20),
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
