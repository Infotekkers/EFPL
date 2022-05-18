import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/transfers/widgets/transfer_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmTransfersPage extends StatelessWidget {
  const ConfirmTransfersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TransferBloc _transferBloc = getIt<TransferBloc>();
    // get all players from arg
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    List allPlayers = args['allPlayers'];

    return BlocConsumer<TransferBloc, TransferState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        List allTransferInfo = formatSwappedPlayers(state, allPlayers);

        // TODO:FIX
        int freeTransferCount = 1;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Confirm Transfers"),
            backgroundColor: ConstantColors.primary_900,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Header
                Container(
                  height: 40,
                  color: ConstantColors.neutral_400,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  width: double.infinity,
                  child: Row(
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 20) * 0.7,
                        child: const Text(
                          "Transfer",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 20) * 0.3,
                        child: const Text(
                          "Cost",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                // transferred players
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                    itemCount: allTransferInfo.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      bool hasFreeTransfer = false;

                      if (freeTransferCount > 0) {
                        hasFreeTransfer = true;
                        freeTransferCount = 0;
                      }

                      return TransferInfoCard(
                        transferInfo: allTransferInfo[index],
                        hasFreeTransfer: hasFreeTransfer,
                      );
                    },
                  ),
                ),

                // Wild Card options
                Container(
                  // height: 60,
                  width: double.infinity,
                  color: ConstantColors.neutral_200,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    children: [
                      // Info as text
                      state.userTeam.deduction == 0
                          ? RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    color: ConstantColors.primary_900),
                                children: [
                                  const TextSpan(
                                      text:
                                          "These transfers will be active for "),
                                  TextSpan(
                                    text:
                                        "Gameweek ${state.userTeam.gameWeekId.value.fold((l) => '', (r) => r)} ",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(text: "and "),
                                  const TextSpan(
                                    text: "no points ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(
                                      text: "will be deducted from your score.")
                                ],
                              ),
                            )
                          : RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    color: ConstantColors.primary_900),
                                children: [
                                  const TextSpan(
                                      text:
                                          "These transfers will be active for "),
                                  TextSpan(
                                    text:
                                        "Gameweek ${state.userTeam.gameWeekId.value.fold((l) => '', (r) => r)} ",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(text: "and "),
                                  TextSpan(
                                    text:
                                        "${state.userTeam.deduction * -1} points ",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(
                                      text: "will be deducted from your score.")
                                ],
                              ),
                            ),
                      // Text
                      state.userTeam.availableChips.contains("WC")
                          ? Container()
                          : const Text(
                              "Wildcard already played.",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                letterSpacing: 0.25,
                                color: ConstantColors.primary_900,
                              ),
                            ),
                      const SizedBox(
                        height: 12,
                      ),

                      // Button
                      InkWell(
                        onTap: () {
                          _transferBloc.add(
                            const TransferEvent.setChip(chipName: "WC"),
                          );
                        },
                        child: Container(
                          height: 35,
                          width: double.infinity,
                          color: state.userTeam.availableChips.contains("WC")
                              ? ConstantColors.primary_900
                              : Colors.grey,
                          child: const Center(
                            child: Text(
                              "Play Wildcard",
                              style: TextStyle(
                                color: ConstantColors.neutral_200,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),

                      // Text
                      state.userTeam.availableChips.contains("FH")
                          ? Container()
                          : const Text(
                              "Free Hit already played.",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                letterSpacing: 0.25,
                                color: ConstantColors.primary_900,
                              ),
                            ),

                      const SizedBox(
                        height: 12,
                      ),

                      InkWell(
                        onTap: () {
                          _transferBloc.add(
                            const TransferEvent.setChip(chipName: "FH"),
                          );
                        },
                        child: Container(
                          height: 35,
                          width: double.infinity,
                          color: state.userTeam.availableChips.contains("FH")
                              ? Colors.amber
                              : Colors.grey,
                          child: const Center(
                            child: Text("Play Free Hit"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 32,
                ),

                // Buttons
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Column(
                    children: [
                      Container(
                        width: 180,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:
                                  ConstantColors.primary_900.withOpacity(0.08),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          color: ConstantColors.primary_900,
                        ),
                        child: TextButton(
                          onPressed: () {
                            _transferBloc.add(
                              const TransferEvent.saveUserPlayers(),
                            );

                            Navigator.pop(context);
                          },
                          child: Text(
                            "Confirm Transfers ( " +
                                state.userTeam.deduction.toString() +
                                " ) ",
                            style: const TextStyle(
                              color: ConstantColors.neutral_200,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:
                                  ConstantColors.primary_900.withOpacity(0.08),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.red.withOpacity(0.65),
                        ),
                        width: 180,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              color: ConstantColors.primary_900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

List formatSwappedPlayers(TransferState state, List allPlayers) {
  // track all processed info
  List allTransfersInfo = [];

  List allSwappedPlayers = state.swappedPlayerIdsList;

  for (var swappedPair in allSwappedPlayers) {
    // get ids
    String playerToTransferOutId = swappedPair.keys.toList()[0];
    String playerToTransferInId = swappedPair.values.toList()[0];

    // get player
    dynamic playerToTransferOut = allPlayers
        .where(
            (player) => player['playerId'].toString() == playerToTransferOutId)
        .toList()[0];

    // get player
    dynamic playerToTransferIn = allPlayers
        .where(
            (player) => player['playerId'].toString() == playerToTransferInId)
        .toList()[0];

    // compile info
    Map transferInfo = {
      "playerOut": {
        "playerName": playerToTransferOut['playerName'],
        "playerPrice": playerToTransferOut['currentPrice'],
        "playerTeam": playerToTransferOut['eplTeamId'],
      },
      "playerIn": {
        "playerName": playerToTransferIn['playerName'],
        "playerPrice": playerToTransferIn['currentPrice'],
        "playerTeam": playerToTransferIn['eplTeamId'],
      }
    };

    // add to array
    allTransfersInfo.add(transferInfo);
  }

  return allTransfersInfo;
}
