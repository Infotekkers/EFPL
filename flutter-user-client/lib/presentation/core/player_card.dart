import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayerWidget extends StatelessWidget {
  final String playerName;
  final String description;
  final String teamName;
  const PlayerWidget(
      {Key? key,
      required this.playerName,
      this.teamName = "shirt.svg",
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        children: [
          // SHIRT
          // SvgPicture.asset(
          //   "assets/icons/shirt.svg",
          //   width: 55,
          //   height: 55,
          // ),
          Container(
            width: 55,
            height: 55,
            child: Text(teamName),
          ),

          // PLAYER NAME
          Container(
            height: 35,
            width: 70,
            color: ConstantColors.primary_900,
            child: Column(
              children: [
                Text(
                  playerName.split(" ")[0],
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ConstantColors.neutral_200,
                  ),
                ),
                Text(
                  playerName.split(" ")[1],
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ConstantColors.neutral_200,
                  ),
                )
              ],
            ),
          ),

          // PRICE/POINT
          Container(
            height: 25,
            width: 70,
            color: ConstantColors.primary_900.withOpacity(0.8),
            child: Center(
              child: Text(
                description,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: ConstantColors.neutral_200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
