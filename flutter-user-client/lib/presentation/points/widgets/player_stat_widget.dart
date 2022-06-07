import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';

class PlayerStatDisplay extends StatelessWidget {
  final String statisticName;
  final int statisticValue;
  final int statisticPoint;
  final bool isColored;
  const PlayerStatDisplay({
    Key? key,
    required this.statisticName,
    required this.statisticValue,
    required this.statisticPoint,
    this.isColored = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      height: 30,
      child: Center(
        child: Row(
          children: [
            // STATISTICS
            SizedBox(
              child: Text(
                statisticName,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              width: MediaQuery.of(context).size.width * 0.5 - 10,
            ),

            // VALUE
            SizedBox(
              child: Text(
                statisticValue.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              width: MediaQuery.of(context).size.width * 0.25 - 10,
            ),

            // PTS
            SizedBox(
              child: Text(
                statisticPoint.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              width: MediaQuery.of(context).size.width * 0.25 - 10,
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.25,
            color: ConstantColors.primary_900.withOpacity(0.5),
          ),
        ),
        color: isColored == true ? Colors.green[50] : Colors.white,
      ),
    );
  }
}
