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
          body: Column(
            children: [
              // Header
              Container(
                height: 30,
                color: Colors.grey,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 10) * 0.7,
                      child: const Text("Transfer"),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 10) * 0.3,
                      child: const Text("Cost"),
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
                height: 60,
                width: double.infinity,
                color: Colors.purple,
                child: const Center(child: Text("Wild Cards")),
              ),

              // Buttons
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        _transferBloc.add(
                          const TransferEvent.saveUserPlayers(),
                        );

                        // Navigator.pop(context);
                      },
                      child: Text(
                        "Confirm Transfers" +
                            " ( " +
                            state.userTeam.deduction.toString() +
                            " ) ",
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Cancel"),
                    ),
                  ],
                ),
              )
            ],
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
