import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';

class TransferInfoCard extends StatelessWidget {
  final Map transferInfo;
  final bool hasFreeTransfer;
  const TransferInfoCard(
      {Key? key, required this.transferInfo, required this.hasFreeTransfer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      color: ConstantColors.neutral_200,
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          // transfers
          SizedBox(
            width: (MediaQuery.of(context).size.width - 10) * 0.7,
            child: Column(
              children: [
                // Transferred in player
                SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      // Icon
                      const Center(
                        child: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Colors.green,
                        ),
                      ),
                      // Player Name
                      Center(
                        child: Text(
                          transferInfo['playerOut']['playerName'].toString() +
                              " ( " +
                              transferInfo['playerOut']['playerPrice']
                                  .toString() +
                              " )",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 16,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Transferred out player
                SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      // Icon
                      const Center(
                        child: Icon(
                          Icons.keyboard_arrow_left_rounded,
                          color: Colors.red,
                        ),
                      ),
                      // Player Name
                      Center(
                        child: Text(
                          transferInfo['playerIn']['playerName'].toString() +
                              " ( " +
                              transferInfo['playerIn']['playerPrice']
                                  .toString() +
                              " )",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Cost
          SizedBox(
            width: (MediaQuery.of(context).size.width - 10) * 0.3,
            child: Center(
              child: Text(
                hasFreeTransfer ? "0pts" : "-4pts",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: hasFreeTransfer ? Colors.green : Colors.red,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
