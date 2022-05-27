import 'package:efpl/application/player/player_bloc.dart';
import 'package:efpl/presentation/core/widgets/bouncing_ball_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerStats extends StatelessWidget {
  const PlayerStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerBloc, PlayerState>(
      listener: (_, state) {},
      builder: (context, state) => state.map(
        initial: (_) => Container(),
        loadInProgress: (_) => const BouncingBallLoadingIndicator(),
        loadSuccess: (state) => Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _buildDataTable(state),
              ),
            )
          ],
        ),
        loadFailure: (state) => const Text("FAIL"),
      ),
    );
  }

  _buildDataTable(state) {
    return DataTable(
      columnSpacing: 20,
      sortAscending: false,
      columns: const [
        DataColumn(
          label: Text("GW"),
          numeric: true,
          tooltip: "Gameweek",
        ),
        DataColumn(
          label: Text("FP"),
          numeric: true,
          tooltip: "Fantasy Points",
        ),
        DataColumn(
          label: Text("MP"),
          numeric: true,
          tooltip: "Minutes Played",
        ),
        DataColumn(
          label: Text("G"),
          numeric: true,
          tooltip: "Goals",
        ),
        DataColumn(
          label: Text("A"),
          numeric: true,
          tooltip: "Assists",
        ),
        DataColumn(
          label: Text("C"),
          numeric: true,
          tooltip: "Cleansheet",
        ),
        DataColumn(
          label: Text("Y"),
          numeric: true,
          tooltip: "Yellows",
        ),
        DataColumn(
          label: Text("R"),
          numeric: true,
          tooltip: "Red",
        ),
        DataColumn(
          label: Text("PM"),
          numeric: true,
          tooltip: "Penalities Missed",
        ),
        DataColumn(
          label: Text("PS"),
          numeric: true,
          tooltip: "Penalities Saved",
        ),
        DataColumn(
          label: Text("S"),
          numeric: true,
          tooltip: "Saves",
        ),
        DataColumn(
          label: Text("OG"),
          numeric: true,
          tooltip: "Own Goals",
        ),
      ],
      rows: List.generate(state.player.score.length, (index) {
        return DataRow(
          selected: index % 2 == 0 ? true : false,
          cells: [
            DataCell(
              Text(state.player.score[index].gameweek.getOrCrash()),
            ),
            DataCell(
              Text(state.player.score[index].fantasyScore?.getOrCrash() ?? ""),
            ),
            DataCell(
              Text(state.player.score[index].minutesPlayed?.getOrCrash() ?? ""),
            ),
            DataCell(
              Text(state.player.score[index].goals?.getOrCrash() ?? ""),
            ),
            DataCell(
              Text(state.player.score[index].assists?.getOrCrash() ?? ""),
            ),
            DataCell(
              Text(state.player.score[index].cleansheet?.getOrCrash() ?? ""),
            ),
            DataCell(
              Text(state.player.score[index].yellows?.getOrCrash() ?? ""),
            ),
            DataCell(
              Text(state.player.score[index].reds?.getOrCrash() ?? ""),
            ),
            DataCell(
              Text(state.player.score[index].penalitiesMissed?.getOrCrash() ??
                  ""),
            ),
            DataCell(
              Text(state.player.score[index].penalitiesSaved?.getOrCrash() ??
                  ""),
            ),
            DataCell(
              Text(state.player.score[index].saves?.getOrCrash() ?? ""),
            ),
            DataCell(
              Text(state.player.score[index].ownGoal?.getOrCrash() ?? ""),
            ),
          ],
        );
      }),
    );
  }
}
