import 'package:cached_network_image/cached_network_image.dart';
import 'package:efpl/application/epl_stats/epl_stats_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EPLStatsViewBody extends StatelessWidget {
  const EPLStatsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _eplStatsBloc = getIt<EPLStatsBloc>()
      ..add(
        const EPLStatsEvent.getEplStats(),
      );

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _eplStatsBloc,
        )
      ],
      child: BlocConsumer<EPLStatsBloc, EPLStatsState>(
        listener: (_, state) => {},
        builder: (context, state) => state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.blue[50],
            child: const Center(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          loadSuccess: (state) => _buildStats(state, context),
          loadFailure: (_) => Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.blue[50],
            child: const Center(
              child: Text("Something Went Wrong"),
            ),
          ),
        ),
      ),
    );
  }

  _buildStats(state, context) {
    final topScorers = state.eplStats.topScorers.getOrCrash();
    final mostAssists = state.eplStats.mostAssists.getOrCrash();
    final mostCleanSheets = state.eplStats.mostCleanSheets.getOrCrash();
    final mostReds = state.eplStats.mostReds.getOrCrash();
    final mostYellows = state.eplStats.mostYellows.getOrCrash();
    final mostSaves = state.eplStats.mostSaves.getOrCrash();
    final mostMinutesPlayed = state.eplStats.mostMinutesPlayed.getOrCrash();

    return SingleChildScrollView(
      key: const Key("eplStatsScrollView"),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
        color: Colors.blue[50],
        child: Column(
          children: [
            StatsTable(
              stat: topScorers,
              statType: "goals",
              title: AppLocalizations.of(context)!.goals,
            ),
            const SizedBox(
              height: 10.0,
            ),
            StatsTable(
              stat: mostAssists,
              statType: "assists",
              title: AppLocalizations.of(context)!.assists,
            ),
            const SizedBox(
              height: 10.0,
            ),
            StatsTable(
              stat: mostCleanSheets,
              statType: "cleanSheets",
              title: AppLocalizations.of(context)!.cleanSheet,
            ),
            const SizedBox(
              height: 10.0,
            ),
            StatsTable(
              stat: mostReds,
              statType: "reds",
              title: AppLocalizations.of(context)!.reds,
            ),
            const SizedBox(
              height: 10.0,
            ),
            StatsTable(
              stat: mostYellows,
              statType: "yellows",
              title: AppLocalizations.of(context)!.yellows,
            ),
            const SizedBox(
              height: 10.0,
            ),
            StatsTable(
              stat: mostSaves,
              statType: "saves",
              title: AppLocalizations.of(context)!.saves,
            ),
            const SizedBox(
              height: 10.0,
            ),
            StatsTable(
              stat: mostMinutesPlayed,
              statType: "minutesPlayed",
              title: AppLocalizations.of(context)!.minutesPlayed,
            ),
          ],
        ),
      ),
    );
  }
}

class StatsTable extends StatelessWidget {
  const StatsTable({
    Key? key,
    required this.stat,
    required this.statType,
    required this.title,
  }) : super(key: key);

  final List stat;
  final String statType;
  final String title;

  @override
  Widget build(BuildContext context) {
    final String _baseURL = dotenv.env["API"].toString();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        elevation: 2.0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          height: 180,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.most + " " + title,
                // textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue[900],
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: stat.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => Container(
                    color: index % 2 == 0 ? Colors.white : Colors.green[50],
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 6,
                            ),
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: CachedNetworkImage(
                                  imageUrl:
                                      "$_baseURL${stat[index]['teamLogo']}"),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              "${stat[index]["name"]}",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "${stat[index][statType]}",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
