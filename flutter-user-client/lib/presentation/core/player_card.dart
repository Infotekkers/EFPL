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
            borderRadius: BorderRadius.circular(15),
          ),
          width: 80,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Card(
            elevation: 0,
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                // SHIRT
                SvgPicture.asset(
                  "assets/icons/shirt.svg",
                  width: 50,
                  height: 50,
                ),

                // PLAYER NAME
                Container(
                  width: 80,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          playerName.split(" ")[0],
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: ConstantColors.primary_900,
                                    // fontSize: 13,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),

                // PRICE/POINT
                SizedBox(
                  width: 70,
                  child: Center(
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
