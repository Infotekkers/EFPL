import 'package:cached_network_image/cached_network_image.dart';
import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';

class UserPlayerWidget extends StatelessWidget {
  final UserPlayer currentUserPlayer;
  const UserPlayerWidget({
    Key? key,
    required this.currentUserPlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _baseURL = dotenv.env["BASE_URL"].toString();
    final String injuryStatus = currentUserPlayer.availability.value.fold(
      (l) => '',
      (r) => r['injuryStatus'].toString(),
    );

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
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
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
                        child: Column(
                          children: [
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
                                state.transferredInPlayerIdList
                                        .contains(currentUserPlayer.playerId)
                                    ? cancelOnePlayerTransfer(_transferBloc,
                                        currentUserPlayer, context)
                                    : transferPlayer(_transferBloc,
                                        currentUserPlayer, context);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    child: const Icon(Boxicons.bx_transfer),
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 3, 0),
                                  ),
                                  state.transferredInPlayerIdList
                                          .contains(currentUserPlayer.playerId)
                                      ? const Text("Cancel Transfer")
                                      : const Text("Transfer")
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
            height: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            color: state.transferredInPlayerIdList
                    .contains(currentUserPlayer.playerId)
                ? ConstantColors.primary_400
                : ConstantColors.neutral_200.withOpacity(0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: _baseURL + currentUserPlayer.eplTeamLogo,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      injuryStatus.isEmpty
                          ? Container()
                          : Positioned(
                              bottom: 0,
                              left: 2,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: int.parse(injuryStatus) < 50
                                      ? ConstantColors.error_200
                                      : ConstantColors.warning_200,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                    child: Text(
                                  injuryStatus + "%",
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                )),
                              ),
                            )
                    ],
                  ),

                  // Player Name
                  Container(
                    color: ConstantColors.primary_900,
                    width: double.infinity,
                    height: 30,
                    child: Center(
                      child: Text(
                        currentUserPlayer.playerName.value.fold(
                          (l) => '',
                          (r) => r.split(" ")[0],
                        ),
                        style: const TextStyle(
                          color: ConstantColors.neutral_200,
                        ),
                      ),
                    ),
                  ),

                  // Player Price
                  Container(
                    height: 25,
                    width: double.infinity,
                    color: ConstantColors.primary_900.withOpacity(0.8),
                    child: Center(
                      child: Text(
                        currentUserPlayer.currentPrice.value.fold(
                          (l) => '',
                          (r) => r.toString(),
                        ),
                        style: const TextStyle(
                          color: ConstantColors.neutral_200,
                        ),
                      ),
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

Future<void> transferPlayer(_transferBloc, currentUserPlayer, context) async {
  // Set player position
  _transferBloc.add(
    TransferEvent.setTransferOutPlayer(
      transferOutPlayerId: currentUserPlayer.playerId,
      playerPosition: currentUserPlayer.playerPosition,
    ),
  );

  // get all players in position
  _transferBloc.add(
    const TransferEvent.getPlayersInSelectedPosition(),
  );

  var efplCache = await Hive.openBox('efplCache');
  List? allTeams = efplCache.get("allTeams");

  Navigator.pop(context);

  Navigator.pushNamed(
    context,
    "/transfer",
    arguments: {"allTeams": allTeams!},
  );
}

void cancelOnePlayerTransfer(_transferBloc, currentUserPlayer, context) {
  _transferBloc.add(
    TransferEvent.cancelOneTransfer(
        playerToCancelId: currentUserPlayer.playerId),
  );

  Navigator.pop(context);
}
