import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';

class PlayerStatDisplay extends StatelessWidget {
  final String statisticName;
  final int statisticValue;
  final int statisticPoint;
  const PlayerStatDisplay({
    Key? key,
    required this.statisticName,
    required this.statisticValue,
    required this.statisticPoint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      height: 25,
      child: Center(
        child: Row(
          children: [
            // STATISTICS
            SizedBox(
              child: Text(statisticName),
              width: MediaQuery.of(context).size.width * 0.5 - 10,
            ),

            // VALUE
            SizedBox(
              child: Text(
                statisticValue.toString(),
                textAlign: TextAlign.center,
              ),
              width: MediaQuery.of(context).size.width * 0.25 - 10,
            ),

            // PTS
            SizedBox(
              child: Text(
                statisticPoint.toString(),
                textAlign: TextAlign.center,
              ),
              width: MediaQuery.of(context).size.width * 0.25 - 10,
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: ConstantColors.primary_900.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
