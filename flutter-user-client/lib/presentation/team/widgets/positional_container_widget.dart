import 'package:efpl/presentation/team/widgets/my_team_player.dart';
import 'package:flutter/material.dart';

class PositionalContainerWidget extends StatelessWidget {
  final String position;
  final Map<String, dynamic> players;
  final List? validOptions;
  final int toBeTransferredOut;

  const PositionalContainerWidget({
    Key? key,
    required this.position,
    required this.players,
    this.validOptions,
    this.toBeTransferredOut = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> playerIds = players.keys.toList();

    return Expanded(
      child: Center(
        child: ListView.builder(
          itemCount: playerIds.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) => MyTeamPlayer(
            playerId: players[playerIds[index]]['playerId'],
            name: players[playerIds[index]]['name'],
            position: players[playerIds[index]]['position'],
            multiplier: players[playerIds[index]]['multiplier'],
            eplTeamId: players[playerIds[index]]['eplTeamId'],
            price: players[playerIds[index]]['price'],
            isCaptain: players[playerIds[index]]['isCaptain'],
            isViceCaptain: players[playerIds[index]]['isViceCaptain'],
            toBeTransferredOut:
                int.parse(playerIds[index]) == toBeTransferredOut
                    ? true
                    : false,
            isTransferable: validOptions != null
                ? validOptions!.contains(int.parse(playerIds[index]))
                    ? true
                    : false
                : false,
          ),
        ),
      ),
    );
  }
}
