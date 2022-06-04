import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/efpl_stats/widgets/efpl_stats_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EFPLStatsPage extends StatelessWidget {
  const EFPLStatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(
        context: context,
      ),
      body: _buildMainBody(context: context),
    );
  }
}

PreferredSizeWidget _buildAppBar({
  required BuildContext context,
}) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 80,
    backgroundColor: Colors.blue[50],
    foregroundColor: ConstantColors.primary_900,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.blue[50],
    ),
    title: Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
      child: Text(
        AppLocalizations.of(context)!.transferList,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.25,
            ),
      ),
    ),
  );
}

Widget _buildMainBody({
  required BuildContext context,
}) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    color: Colors.blue[50],
    child: Column(
      children: [
        _buildGameWeekController(context: context),

        const SizedBox(
          height: 30,
        ),

        // TITLE
        Text(
          "Gameweek 30 Summary",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.55,
              ),
        ),

        const SizedBox(
          height: 24,
        ),

        _buildInfoCard(
          context: context,
        )
      ],
    ),
  );
}

Widget _buildGameWeekController({required BuildContext context}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
    height: 50,
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            // fixtureBloc.add(
            //   const FixtureEvent.decreaseGameWeek(),
            // );
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        Text(AppLocalizations.of(context)!.gameWeek +
            " " +
            //     state.gameWeekId.toString(),
            // style: Theme.of(context).textTheme.bodyText1,
            "30"),
        InkWell(
          onTap: () {
            // fixtureBloc.add(
            //   const FixtureEvent.increaseGameWeek(),
            // );
          },
          child: const Icon(Icons.arrow_forward_ios),
        )
      ],
    ),
  );
}

Widget _buildInfoCard({required BuildContext context}) {
  return Container(
    height: 460,
    // width: MediaQuery.of(context).size.width * 0.9;;,
    child: Column(
      children: [
        // Highest Point
        const EFPLStatsCard(
          label: 'Highest Points',
          value: '120',
          isColored: false,
        ),

        // Average Point
        const EFPLStatsCard(
          label: 'Average Points',
          value: '120',
          isColored: true,
        ),

        // Most Selected
        const EFPLStatsCard(
          label: 'Most Selected',
          value: 'Cancelo',
          isColored: false,
        ),

        // Most Transferred Out
        const EFPLStatsCard(
          label: 'Most Transferred Out',
          value: 'Zaha',
          isColored: true,
        ),

        // Most Captained
        const EFPLStatsCard(
          label: 'Most Captained',
          value: 'Son',
          isColored: false,
        ),

        // Most Vice Captained
        const EFPLStatsCard(
          label: 'Most Vice Captained',
          value: 'Sancho',
          isColored: true,
        ),

        // Bench Boost Count
        const EFPLStatsCard(
          label: 'Bench Boost Played',
          value: '300000',
          isColored: false,
        ),

        // Free Hit Count
        const EFPLStatsCard(
          label: 'Free Hit Played',
          value: '450300',
          isColored: true,
        ),

        // Wildcard Count
        const EFPLStatsCard(
          label: 'Wildcards Played',
          value: '450300',
          isColored: false,
        ),

        const SizedBox(
          height: 36,
        ),

        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/efpl/dreamTeam");
          },
          child: Container(
            width: 275,
            height: 40,
            color: ConstantColors.primary_900,
            child: Center(
              child: Text(
                "GAMEWEEK 38 DREAM TEAM",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 16,
                      color: ConstantColors.neutral_200,
                      letterSpacing: 0.25,
                    ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
