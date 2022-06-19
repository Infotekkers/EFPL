import 'package:efpl/presentation/team/widgets/my_team_player.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

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
    playerIds.sort((a, b) => a.compareTo(b));
    if (position == 'sub') {
      for (var playerId in playerIds) {
        if (players[playerId]['position'] == 'gk') {
          playerIds.remove(playerId);
          playerIds.insert(0, playerId);
        }
      }
    }

    return Expanded(
      child: SizedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
          decoration: position == 'sub'
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[200],
                  // boxShadow: [
                  //   BoxShadow(
                  //     offset: const Offset(-20, -20),
                  //     blurRadius: 60,
                  //     color: Colors.blue[50]!,
                  //     inset: true,
                  //   ),
                  //   BoxShadow(
                  //     offset: const Offset(20, 20),
                  //     blurRadius: 60,
                  //     color: Color.fromRGBO(85, 130, 167, 1)!,
                  //     inset: true,
                  //   ),
                  // ],
                )
              : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListView.separated(
              separatorBuilder: (_, index) {
                if (position == 'sub' && index == 0) {
                  return const SizedBox(width: 50);
                }
                return const SizedBox(width: 0);
              },
              itemCount: playerIds.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (_, index) => MyTeamPlayer(
                playerId: players[playerIds[index]]['playerId'],
                name: players[playerIds[index]]['name'],
                position: players[playerIds[index]]['position'],
                multiplier: players[playerIds[index]]['multiplier'].toDouble(),
                eplTeamId: players[playerIds[index]]['eplTeamId'],
                price: players[playerIds[index]]['price'].toDouble(),
                isCaptain: players[playerIds[index]]['isCaptain'],
                isViceCaptain: players[playerIds[index]]['isViceCaptain'],
                availability: players[playerIds[index]]['availability'] ??
                    {'injuryStatus': "100", 'injuryMessage': "Fit to play"},
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
        ),
      ),
    );
  }
}
