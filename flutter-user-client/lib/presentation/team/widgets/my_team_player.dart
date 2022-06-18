import 'package:efpl/application/my_team/myteam_bloc.dart';
import 'package:efpl/services/global_vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTeamPlayer extends StatelessWidget {
  final int playerId;
  final String name;
  final String position;
  final double multiplier;
  final String eplTeamId;
  final double price;
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
  Widget build(BuildContext context) => Container(
        // margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 3),
        width: 85,
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
            if (toBeTransferredOut) {
            } else if (isTransferable) {
              BlocProvider.of<MyTeamBloc>(context).add(
                MyTeamEvent.transferConfirmed(
                    playerId, position, multiplier == 0 ? true : false),
              );
            } else {
              showBottomModal(context, multiplier == 0 ? true : false);
            }
          },
          onLongPress: () {
            BlocProvider.of<MyTeamBloc>(context).add(
              MyTeamEvent.transferOptionsRequested(
                  playerId, position, multiplier == 0 ? true : false),
            );
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/jerseys/" + eplTeamId + ".png",
                    width: 50,
                    height: 50,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 2,
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
                    top: 5,
                    left: 10,
                    child: availability['injuryStatus'] == '100'
                        ? Container()
                        : _buildAvailabilityIndicator(context: context),
                  )
                ],
              ),
              _buildInfoBox(context: context),
            ],
          ),
        ),
      );

  _buildAvailabilityIndicator({required BuildContext context}) {
    return Card(
      elevation: 2,
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: SizedBox(
        height: 22,
        width: 22,
        child: Center(
          child: Text(
            availability['injuryStatus'],
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _buildInfoBox({required BuildContext context}) {
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
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
      height: 20,
      width: 20,
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
                    const SizedBox(width: 1),
                    const Text(
                      "Ⓥ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 7),
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
