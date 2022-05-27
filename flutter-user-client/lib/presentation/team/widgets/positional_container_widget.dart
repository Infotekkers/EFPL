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

    return Expanded(
      child: SizedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 2.0),
          decoration: position == 'sub'
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFE0E0E0),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(-20, -20),
                      blurRadius: 60,
                      color: Colors.white,
                      inset: true,
                    ),
                    BoxShadow(
                      offset: Offset(20, 20),
                      blurRadius: 60,
                      color: Color.fromARGB(255, 125, 160, 194),
                      inset: true,
                    ),
                  ],
                )
              : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ListView.separated(
              separatorBuilder: (_, index) {
                if (position == 'sub' && index == 0) {
                  return const SizedBox(width: 50);
                }
                return const SizedBox(width: 2);
              },
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
                availability: players[playerIds[index]]['availability'],
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
