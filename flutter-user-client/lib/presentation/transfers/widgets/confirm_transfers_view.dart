import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/transfers/widgets/transfer_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmTransfersPage extends StatelessWidget {
  const ConfirmTransfersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TransferBloc _transferBloc = getIt<TransferBloc>();
    // get all players from arg
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    List allPlayers = args['allPlayers'];

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _transferBloc,
        ),
      ],
      child: BlocBuilder<TransferBloc, TransferState>(
        builder: (context, state) {
          List allTransferInfo = formatSwappedPlayers(state, allPlayers);

          int freeTransferCount = state.userTeam.freeTransfers;
          return Scaffold(
            appBar: _buildAppBar(context: context),
            body: Container(
              color: Colors.blue[50],
              child: _buildMainView(
                context: context,
                freeTransferCount: freeTransferCount,
                state: state,
                transferBloc: _transferBloc,
                allTransferInfo: allTransferInfo,
              ),
            ),
          );
        },
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar({required BuildContext context}) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    toolbarHeight: 80,
    backgroundColor: Colors.blue[50],
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.blue[50],
    ),
    foregroundColor: ConstantColors.primary_900,
    title: Text(
      AppLocalizations.of(context)!.confirmTransfers,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.25,
          ),
    ),
  );
}

Widget _buildMainView(
    {required BuildContext context,
    required List allTransferInfo,
    required int freeTransferCount,
    required TransferState state,
    required TransferBloc transferBloc}) {
  return SingleChildScrollView(
    child: Column(
      children: [
        // HEADER
        Container(
          height: 40,
          color: ConstantColors.primary_900,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          width: double.infinity,
          child: Row(
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width - 20) * 0.7,
                child: Text(
                  AppLocalizations.of(context)!.transfers,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ConstantColors.neutral_300,
                      ),
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width - 20) * 0.3,
                child: Text(
                  AppLocalizations.of(context)!.points,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ConstantColors.neutral_300,
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
          width: double.infinity,
          color: ConstantColors.neutral_200,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            children: [
              // Info as text
              state.userTeam.deduction == 0
                  ? RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: ConstantColors.primary_900,
                              height: 1.4,
                            ),
                        children: [
                          TextSpan(
                            text: AppLocalizations.of(context)!
                                    .theseTransfersWillBeActiveFor +
                                " ",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          TextSpan(
                            text: " " +
                                AppLocalizations.of(context)!.gameWeek +
                                " ${state.userTeam.gameWeekId.value.fold((l) => '', (r) => r)} ",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          TextSpan(
                            text: AppLocalizations.of(context)!.and + " ",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          TextSpan(
                            text: " " +
                                AppLocalizations.of(context)!.noPoints +
                                " ",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          TextSpan(
                            text: " " +
                                AppLocalizations.of(context)!
                                    .noWillBeDeductedFromYourScore,
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                    )
                  : RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: ConstantColors.primary_900,
                              height: 1.4,
                            ),
                        children: [
                          TextSpan(
                            text: AppLocalizations.of(context)!
                                .theseTransfersWillBeActiveFor,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          TextSpan(
                            text: AppLocalizations.of(context)!.gameWeek +
                                " ${state.userTeam.gameWeekId.value.fold((l) => '', (r) => r)} ",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          TextSpan(
                            text: AppLocalizations.of(context)!.and + " ",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          TextSpan(
                            text: "${state.userTeam.deduction * -1} " +
                                AppLocalizations.of(context)!.points,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          TextSpan(
                            text: AppLocalizations.of(context)!
                                .willBeDeductedFromYourScore,
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                    ),
              // Text
              state.userTeam.availableChips.contains("WC")
                  ? Container()
                  : Text(
                      AppLocalizations.of(context)!.wildcardAlreadyPlayed,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                  transferBloc.add(
                    const TransferEvent.setChip(chipName: "WC"),
                  );
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  color: state.userTeam.availableChips.contains("WC")
                      ? ConstantColors.primary_900
                      : Colors.grey,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.playWildCard,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ConstantColors.neutral_300,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.25,
                            fontSize: 18,
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
                  : Text(
                      AppLocalizations.of(context)!.freeHitAlreadyPlayed,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                  transferBloc.add(
                    const TransferEvent.setChip(chipName: "FH"),
                  );
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  color: state.userTeam.availableChips.contains("FH")
                      ? Colors.amber
                      : Colors.grey,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.playFreeHit,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.25,
                            fontSize: 18,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // SPACER
        const SizedBox(
          height: 32,
        ),

        // Buttons
        SizedBox(
          width: double.infinity,
          height: 318,
          child: Column(
            children: [
              Container(
                width: 230,
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ConstantColors.primary_900.withOpacity(0.08),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: ConstantColors.primary_900,
                ),
                child: TextButton(
                  key: const Key("confirmTransfersPageSaveButton"),
                  onPressed: () {
                    transferBloc.add(
                      TransferEvent.saveUserPlayers(
                        gameWeekId: state.userTeam.gameWeekId.value.fold(
                          (l) => 1,
                          (r) => r,
                        ),
                        isSetTeam: state.isInitialSelection,
                      ),
                    );

                    Navigator.pop(context);

                    if (state.isInitialSelection == true) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/home', (Route<dynamic> route) => false);

                      Navigator.of(context).pushNamed("/home");
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context)!.confirmTransfers +
                        " ( " +
                        (state.userTeam.deduction).toString() +
                        " ) ",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: ConstantColors.neutral_200,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                  ),
                ),
              ),

              // SPACER
              const SizedBox(
                height: 35,
              ),

              // CANCEL BUTTON
              Container(
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ConstantColors.primary_900.withOpacity(0.08),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.red.withOpacity(0.65),
                ),
                width: 230,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    getIt<TransferBloc>()
                        .add(const TransferEvent.cancelTransferFromConfirm());
                  },
                  child: Text(
                    AppLocalizations.of(context)!.cancelTransfers,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: ConstantColors.primary_900,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
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
