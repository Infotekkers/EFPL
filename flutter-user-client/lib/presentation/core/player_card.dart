import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayerWidget extends StatelessWidget {
  final String playerName;
  final String description;
  final String teamName;
  final String availability;
  const PlayerWidget(
      {Key? key,
      required this.playerName,
      this.teamName = "shirt.svg",
      required this.description,
      this.availability = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Card
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Colors.white,
          ),
          width: 70,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                // SHIRT
                SvgPicture.asset(
                  "assets/icons/shirt.svg",
                  width: 50,
                  height: 50,
                ),

                // PLAYER NAME
                Container(
                  height: 16,
                  width: 70,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          playerName.split(" ")[0],
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: ConstantColors.primary_900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // PRICE/POINT
                SizedBox(
                  height: 15,
                  width: 70,
                  // color: ConstantColors.primary_900.withOpacity(0.8),
                  child: Center(
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: ConstantColors.primary_900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // availability
        Positioned(
          right: 15,
          top: 15,
          child: availability == ""
              ? Container()
              : Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: int.parse(availability) > 50
                        ? Colors.yellow
                        : Colors.red,
                  ),
                ),
        ),
      ],
    );
  }
}
