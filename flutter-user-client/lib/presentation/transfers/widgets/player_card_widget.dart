import 'dart:ui';

import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/injectable.dart';
import 'package:flutter/material.dart';

class UserPlayerCard extends StatelessWidget {
  final UserPlayer currentPlayer;
  const UserPlayerCard({Key? key, required this.currentPlayer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getIt<TransferBloc>().add(
          TransferEvent.transferUserPlayer(
            transferPlayerId: currentPlayer.playerId,
          ),
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
        height: 60,
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
                    color: Colors.blue,
                    margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  ),

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
                                fontSize: 16, fontFamily: "Architect"),
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
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text(
                currentPlayer.currentPrice.value.fold(
                  (l) => '',
                  (r) => r.toString(),
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),

            // Total Points
            // Price
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              child: const Text(
                "Score",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
