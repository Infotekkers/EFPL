import 'package:efpl/application/efpl_stats/efpl_stats_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/efpl_stats/widgets/efpl_stats_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EFPLStatsPage extends StatelessWidget {
  const EFPLStatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get bloc
    final EfplStatsBloc _efplBloc = getIt<EfplStatsBloc>()
      ..add(
        const EfplStatsEvent.getEfplStats(gameWeekId: 0),
      );
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _efplBloc),
      ],
      child: BlocConsumer<EfplStatsBloc, EfplStatsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: _buildAppBar(
              context: context,
            ),
            body: _buildMainBody(context: context, state: state),
            // body: Text(state.toString()),
          );
        },
      ),
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
  required EfplStatsState state,
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
          state: state,
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

Widget _buildInfoCard(
    {required BuildContext context, required EfplStatsState state}) {
  return Container(
    height: 470,
    // width: MediaQuery.of(context).size.width * 0.9;;,
    child: Column(
      children: [
        // Highest Point
        EFPLStatsCard(
          label: 'Highest Points',
          value: state.highestPoint.toString(),
          isColored: false,
        ),

        // Average Point
        EFPLStatsCard(
          label: 'Average Points',
          value: state.averagePoint.toString(),
          isColored: true,
        ),

        // Most Selected
        EFPLStatsCard(
          label: 'Most Selected',
          value: state.mostSelectedPlayer,
          isColored: false,
        ),

        // Most Transferred Out
        EFPLStatsCard(
          label: 'Most Transferred Out',
          value: state.mostTransferredOutPlayer,
          isColored: true,
        ),

        // Most Captained
        EFPLStatsCard(
          label: 'Most Captained',
          value: state.mostCaptainedPlayer,
          isColored: false,
        ),

        // Most Vice Captained
        EFPLStatsCard(
          label: 'Most Vice Captained',
          value: state.mostViceCaptainedPlayer,
          isColored: true,
        ),

        // Bench Boost Count
        EFPLStatsCard(
          label: 'Bench Boost Played',
          value: state.benchBoostCount.toString(),
          isColored: false,
        ),

        // Free Hit Count
        EFPLStatsCard(
          label: 'Free Hit Played',
          value: state.freeHitCount.toString(),
          isColored: true,
        ),

        // Wildcard Count
        EFPLStatsCard(
          label: 'Wildcards Played',
          value: state.wildCardCount.toString(),
          isColored: false,
        ),

        // Wildcard Count
        EFPLStatsCard(
          label: 'Triple Captain Played',
          value: state.tripleCaptainCount.toString(),
          isColored: true,
        ),

        const SizedBox(
          height: 30,
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
