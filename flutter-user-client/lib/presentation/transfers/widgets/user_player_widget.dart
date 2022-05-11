import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:efpl/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class UserPlayerWidget extends StatelessWidget {
  final UserPlayer currentUserPlayer;
  const UserPlayerWidget({
    Key? key,
    required this.currentUserPlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferBloc, TransferState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        TransferBloc _transferBloc = getIt<TransferBloc>();

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
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 8),
                        color: Colors.amber,
                        child: Column(
                          children: [
                            Text(state.selectedPlayerPosition.toString()),
                            // Player Name
                            Text(
                              currentUserPlayer.playerName.value
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
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 3, 0),
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
                                // se
                                // Set player position
                                _transferBloc.add(
                                  TransferEvent.setTransferOutPlayer(
                                    transferOutPlayerId:
                                        currentUserPlayer.playerId,
                                    playerPosition:
                                        currentUserPlayer.playerPosition,
                                  ),
                                );

                                // get all players in position
                                _transferBloc.add(
                                  const TransferEvent
                                      .getPlayersInSelectedPosition(),
                                );

                                Navigator.pop(context);

                                Navigator.pushNamed(context, "/transfer");
                              },
                              child: Row(
                                children: [
                                  Container(
                                    child: const Icon(Boxicons.bx_transfer),
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 3, 0),
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
            margin: const EdgeInsets.symmetric(horizontal: 5),
            color: state.transferredInPlayerIds
                    .contains(currentUserPlayer.playerId)
                ? Colors.yellowAccent
                : Colors.purple,
            child: Center(
              child: Column(
                children: [
                  Text(
                    currentUserPlayer.playerName.value
                        .fold((l) => '', (r) => r),
                  ),
                  Text(
                    currentUserPlayer.currentPrice.value.fold(
                      (l) => '',
                      (r) => r.toString(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
