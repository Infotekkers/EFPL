import 'package:efpl/application/my_team/myteam_bloc.dart';
import 'package:efpl/services/global_vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTeamPlayer extends StatelessWidget {
  final int playerId;
  final String name;
  final String position;
  final int multiplier;
  final String eplTeamId;
  final int price;
  final bool isCaptain;
  final bool isViceCaptain;
  final bool isTransferable;
  final bool toBeTransferredOut;
  final Map availability;

  const MyTeamPlayer({
    Key? key,
    required this.playerId,
    required this.name,
    required this.position,
    required this.multiplier,
    required this.eplTeamId,
    required this.price,
    required this.isCaptain,
    required this.isViceCaptain,
    required this.isTransferable,
    required this.toBeTransferredOut,
    required this.availability,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        elevation: isTransferable
            ? 5
            : toBeTransferredOut
                ? 5
                : 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: isTransferable
            ? Colors.green[300]
            : toBeTransferredOut
                ? Colors.amber[800]
                : Colors.white,
        child: GestureDetector(
          onTap: () {
            if (toBeTransferredOut) {
            } else if (isTransferable) {
              BlocProvider.of<MyTeamBloc>(context).add(
                  MyTeamEvent.transferConfirmed(
                      playerId, position, multiplier == 0 ? true : false));
            } else {
              showBottomModal(context, multiplier == 0 ? true : false);
            }
          },
          onLongPress: () {
            BlocProvider.of<MyTeamBloc>(context).add(
                MyTeamEvent.transferOptionsRequested(
                    playerId, position, multiplier == 0 ? true : false));
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/shirt_placeholder.png",
                    width: 60,
                    height: 50,
                  ),
                  Positioned(
                    left: 35,
                    top: 30,
                    child: Card(
                      elevation: 1,
                      color: Colors.blue[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: isCaptain
                          ? _buildCaptainBadge("C")
                          : isViceCaptain
                              ? _buildCaptainBadge("V")
                              : null,
                    ),
                  ),
                  Positioned(
                    left: 35,
                    top: 0,
                    child: availability['injuryStatus'] == '100'
                        ? Container()
                        : _buildAvailabilityIndicator(),
                  )
                ],
              ),
              _buildInfoBox(),
            ],
          ),
        ),
      );

  _buildAvailabilityIndicator() {
    return Card(
      elevation: 2,
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: SizedBox(
        height: 20,
        width: 20,
        child: Center(
          child: Text(
            availability['injuryStatus'],
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _buildInfoBox() {
    return SizedBox(
      height: 50,
      width: 80,
      child: Card(
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(name.split(" ")[0], overflow: TextOverflow.ellipsis),
            Text(
              position.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildCaptainBadge(power) {
    return SizedBox(
      width: 20,
      height: 15,
      child: Center(
        child: Text(
          power,
          style: TextStyle(color: Colors.grey[50]),
        ),
      ),
    );
  }

  Future<dynamic> showBottomModal(BuildContext context, bool isSub) {
    final MyTeamBloc myTeamBloc = BlocProvider.of<MyTeamBloc>(context);

    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      builder: (_) => SizedBox(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(name),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed("/player", arguments: playerId),
                child: Row(
                  children: [
                    const Icon(Icons.info),
                    const SizedBox(width: 5),
                    Text(strings(context).playerInfo),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  myTeamBloc.add(MyTeamEvent.transferOptionsRequested(
                      playerId, position, isSub));
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    const Icon(Icons.compare_arrows),
                    const SizedBox(width: 5),
                    Text(strings(context).switchPlayer)
                  ],
                ),
              ),
              GestureDetector(
                onTap: multiplier > 0
                    ? () {
                        myTeamBloc.add(MyTeamEvent.captainChanged(playerId));
                        Navigator.pop(context);
                      }
                    : () {},
                child: Row(
                  children: [
                    const Icon(Icons.copyright),
                    const SizedBox(width: 5),
                    Text(strings(context).makeCaptain),
                  ],
                ),
              ),
              GestureDetector(
                onTap: multiplier > 0
                    ? () {
                        myTeamBloc
                            .add(MyTeamEvent.viceCaptainChanged(playerId));
                        Navigator.pop(context);
                      }
                    : (() {}),
                child: Row(
                  children: [
                    const Icon(Icons.copyright),
                    const SizedBox(width: 5),
                    Text(strings(context).makeViceCaptain),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
