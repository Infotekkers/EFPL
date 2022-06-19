import 'package:efpl/application/my_team/myteam_bloc.dart';
import 'package:efpl/presentation/colors.dart';
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
        // padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 69,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isTransferable
              ? Colors.green[300]
              : toBeTransferredOut
                  ? Colors.amber[800]
                  : Colors.white,
        ),

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
                    "assets/jerseys/" + eplTeamId + ".png",
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
                          ? _buildCaptainBadge("C", context)
                          : isViceCaptain
                              ? _buildCaptainBadge("V", context)
                              : null,
                    ),
                  ),
                  Positioned(
                    left: 35,
                    top: 0,
                    child: availability['injuryStatus'] == '100'
                        ? Container()
                        : _buildAvailabilityIndicator(context),
                  )
                ],
              ),
              _buildInfoBox(context),
            ],
          ),
        ),
      );

  _buildAvailabilityIndicator(context) {
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
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                  fontSize: 10.5,
                ),
          ),
        ),
      ),
    );
  }

  _buildInfoBox(context) {
    return SizedBox(
      height: 50,
      width: 80,
      child: Card(
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              name.split(" ")[0],
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1!,
            ),
            Text(
              position.toLowerCase() == 'gk'
                  ? strings(context).gk
                  : position.toLowerCase() == 'def'
                      ? strings(context).def
                      : position.toLowerCase() == 'mid'
                          ? strings(context).mid
                          : strings(context).att,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 12, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }

  _buildCaptainBadge(power, context) {
    return SizedBox(
      width: 20,
      height: 15,
      child: Center(
        child: Text(
          power,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.grey[50],
                fontSize: 10.5,
              ),
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
        height: 280,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.25,
                      ),
                ),
              ),
              Center(
                child: Text(
                  "( " + eplTeamId + " )",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12,
                        letterSpacing: 0.25,
                      ),
                ),
              ),
              // Spacer
              const SizedBox(
                height: 16,
              ),

              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed("/player", arguments: playerId),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info,
                      color: ConstantColors.primary_900,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      strings(context).playerInfo,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 15,
                          ),
                    ),
                  ],
                ),
              ),
              // Spacer
              const SizedBox(
                height: 16,
              ),

              GestureDetector(
                onTap: () {
                  myTeamBloc.add(MyTeamEvent.transferOptionsRequested(
                      playerId, position, isSub));
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.compare_arrows,
                      color: ConstantColors.primary_900,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      strings(context).switchPlayer,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 15,
                          ),
                    )
                  ],
                ),
              ),
              // Spacer
              const SizedBox(
                height: 16,
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
                    const Icon(
                      Icons.copyright,
                      color: ConstantColors.primary_900,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      strings(context).makeCaptain,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 15,
                          ),
                    ),
                  ],
                ),
              ),
              // Spacer
              const SizedBox(
                height: 16,
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
                        fontSize: 20,
                        color: ConstantColors.primary_900,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      strings(context).makeViceCaptain,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 15,
                          ),
                    ),
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
