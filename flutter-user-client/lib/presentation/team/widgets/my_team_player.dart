import 'package:efpl/application/my_team/myteam_bloc.dart';
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: isTransferable
            ? Colors.green[300]
            : toBeTransferredOut
                ? Colors.grey
                : Colors.white,
        child: Column(
          children: [
            GestureDetector(
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
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/shirt_placeholder.png",
                    width: 60,
                    height: 50,
                  ),
                  SizedBox(
                    height: 60,
                    width: 80,
                    child: Card(
                      child: Column(
                        children: [
                          Text(name.split(" ")[0]),
                          Text(position.toUpperCase()),
                          isCaptain
                              ? const Text("C")
                              : isViceCaptain
                                  ? const Text("V")
                                  : const Text(""),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

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
        height: 150,
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
                  children: const [
                    Icon(Icons.info),
                    SizedBox(width: 5),
                    Text("Player Information"),
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
                  children: const [
                    Icon(Icons.compare_arrows),
                    SizedBox(width: 5),
                    Text("Transfer"),
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
