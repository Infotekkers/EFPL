import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayerWidget extends StatelessWidget {
  final String playerName;
  final String description;
  final String teamName;
  final String availability;
  final bool isCaptain;
  final bool isViceCaptain;
  const PlayerWidget(
      {Key? key,
      required this.playerName,
      this.teamName = "shirt.svg",
      required this.description,
      this.isCaptain = false,
      this.isViceCaptain = false,
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
                Stack(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        "assets/icons/shirt.svg",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    // IS CAPTAIN
                    _buildCaptainView(
                      context: context,
                      isCaptain: isCaptain,
                      isViceCaptain: isViceCaptain,
                    ),

                    _buildInjuryView(
                      context: context,
                      injuryStatus: availability,
                    )
                  ],
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
      ],
    );
  }
}

Widget _buildCaptainView(
    {required bool isCaptain,
    required bool isViceCaptain,
    required BuildContext context}) {
  return isCaptain == false && isViceCaptain == false
      ? Container()
      : Positioned(
          bottom: 3,
          right: 5,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.blue[400],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                isCaptain ? "C" : "V",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        );
}

Widget _buildInjuryView(
    {required String injuryStatus, required BuildContext context}) {
  return injuryStatus == '' || injuryStatus == 'none'
      ? Container()
      : Positioned(
          top: 5,
          left: 10,
          child: Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              color: int.parse(injuryStatus.toString()) >= 50
                  ? Colors.amber
                  : Colors.red,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                injuryStatus,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                      color: int.parse(injuryStatus.toString()) >= 50
                          ? Colors.black
                          : Colors.white,
                    ),
              ),
            ),
          ),
        );
}
