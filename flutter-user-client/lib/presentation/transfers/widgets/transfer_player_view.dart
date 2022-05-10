import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/transfers/widgets/player_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferPlayerView extends StatelessWidget {
  const TransferPlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferBloc, TransferState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        List<UserPlayer> allPositionPlayers = state.selectedPlayerReplacements
            .where(
              (element) => element.playerId != state.transferPlayerId,
            )
            .toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Transfer List",
              style: TextStyle(
                fontFamily: "Architect",
                fontSize: 18,
              ),
            ),
          ),
          body: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        // Filter
                        Container(
                          height: 150,
                          color: Colors.red,
                        ),

                        // Header
                        Container(
                          height: 30,
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.grey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Player Name
                              SizedBox(
                                child: const Text(
                                  "Player",
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 0.5,
                                    fontFamily: "Architect",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.55,
                              ),

                              // Price
                              SizedBox(
                                child: const Text(
                                  "Price",
                                  style: TextStyle(
                                    fontSize: 16,
                                    // letterSpacing: 0.,
                                    fontFamily: "Architect",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),

                              // Score Sum
                              SizedBox(
                                child: const Text(
                                  "Points",
                                  style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0.5,
                                    fontFamily: "Architect",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.15,
                              )
                            ],
                          ),
                        ),

                        // Players,
                        ListView.builder(
                            itemCount: allPositionPlayers.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return UserPlayerCard(
                                currentPlayer: allPositionPlayers[index],
                              );
                            }),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
