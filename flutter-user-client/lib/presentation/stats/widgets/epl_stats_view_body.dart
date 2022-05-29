import 'package:efpl/application/epl_stats/epl_stats_bloc.dart';
import 'package:efpl/domain/epl_stats/value_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EPLStatsViewBody extends StatelessWidget {
  const EPLStatsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EPLStatsBloc, EPLStatsState>(
      listener: (_, state) => {},
      builder: (context, state) => state.map(
        initial: (_) => Container(),
        loadInProgress: (_) => const Center(
          child: Text('Loading'),
        ),
        loadSuccess: (state) => _buildStats(state, context),
        loadFailure: (_) => const Center(
          child: Text("Error"),
        ),
      ),
      // builder: (context, state) {
      //   return Center(
      //     child: Text(state.toString()),
      //   );
      // },
    );
  }

  _buildStats(state, context) {
    final topScorers = state.eplStats.topScorers.getOrCrash();
    final mostAssists = state.eplStats.mostAssists.getOrCrash();
    final mostCleanSheets = state.eplStats.mostCleanSheets.getOrCrash();

    return Column(
      children: [
        Expanded(
          child: StatsTable(
            stat: topScorers,
            statType: "goals",
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: StatsTable(
            stat: mostAssists,
            statType: "assists",
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: StatsTable(
            stat: mostCleanSheets,
            statType: "cleanSheets",
          ),
        ),
      ],
    );
  }
}

class StatsTable extends StatelessWidget {
  const StatsTable({
    Key? key,
    required this.stat,
    required this.statType,
  }) : super(key: key);

  final List stat;
  final String statType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Most ${statType.toLowerCase()}",
          textAlign: TextAlign.left,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: stat.length,
            shrinkWrap: true,
            itemBuilder: (_, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${stat[index]["name"]}"),
                Text("${stat[index][statType]}"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
