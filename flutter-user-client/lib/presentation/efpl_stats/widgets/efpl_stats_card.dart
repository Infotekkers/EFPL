import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EFPLStatsCard extends StatelessWidget {
  final String label;
  final String value;
  final bool isColored;
  const EFPLStatsCard({
    Key? key,
    required this.label,
    required this.value,
    required this.isColored,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: ConstantColors.neutral_200,
        ),
        color: isColored == true ? Colors.green[100] : Colors.blue[50],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Container(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    letterSpacing: 0.25,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            width: MediaQuery.of(context).size.width * 0.55,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    letterSpacing: 0.25,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
