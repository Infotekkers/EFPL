import 'package:efpl/domain/player/player.dart';
import 'package:flutter/material.dart';

class PlayerStats extends StatelessWidget {
  final dynamic state;

  const PlayerStats({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatTable(score: List.from(state.player.score.reversed));
  }
}

class StatTable extends StatefulWidget {
  final List<Score> score;
  const StatTable({Key? key, required this.score}) : super(key: key);

  @override
  State<StatTable> createState() => _StatTableState();
}

class _StatTableState extends State<StatTable> {
  // ignore: unused_field
  int _currentSortColumn = 0;
  bool _isAscending = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 4,
        sortAscending: false,
        columns: [
          DataColumn(
            label: const Text("GW"),
            numeric: true,
            tooltip: "Gameweek",
            onSort: (columnIndex, _) => setState(() {
              _currentSortColumn = columnIndex;

              if (_isAscending == true) {
                _isAscending = false;
                widget.score.sort(
                  (gwA, gwB) => gwB.gameweek.getOrCrash().compareTo(
                        gwA.gameweek.getOrCrash(),
                      ),
                );
              } else if (_isAscending == false) {
                _isAscending = true;
                widget.score.sort(
                  (gwA, gwB) => gwA.gameweek.getOrCrash().compareTo(
                        gwB.gameweek.getOrCrash(),
                      ),
                );
              }
            }),
          ),
          DataColumn(
            label: const Text("FP"),
            numeric: true,
            tooltip: "Fantasy Points",
            onSort: (columnIndex, _) => setState(() {
              _currentSortColumn = columnIndex;

              if (_isAscending == true) {
                _isAscending = false;
                widget.score.sort(
                  (gwA, gwB) =>
                      (gwB.fantasyScore?.getOrCrash() ?? "").compareTo(
                    (gwA.fantasyScore?.getOrCrash() ?? ""),
                  ),
                );
              } else if (_isAscending == false) {
                _isAscending = true;
                widget.score.sort(
                  (gwA, gwB) =>
                      (gwA.fantasyScore?.getOrCrash() ?? "").compareTo(
                    (gwB.fantasyScore?.getOrCrash() ?? ""),
                  ),
                );
              }
            }),
          ),
          DataColumn(
            label: const Text("MP"),
            numeric: true,
            tooltip: "Minutes Played",
            onSort: (columnIndex, _) => setState(() {
              _currentSortColumn = columnIndex;

              if (_isAscending == true) {
                _isAscending = false;
                widget.score.sort(
                  (gwA, gwB) =>
                      (gwB.minutesPlayed?.getOrCrash() ?? "").compareTo(
                    (gwA.minutesPlayed?.getOrCrash() ?? ""),
                  ),
                );
              } else if (_isAscending == false) {
                _isAscending = true;
                widget.score.sort(
                  (gwA, gwB) =>
                      (gwA.minutesPlayed?.getOrCrash() ?? "").compareTo(
                    (gwB.minutesPlayed?.getOrCrash() ?? ""),
                  ),
                );
              }
            }),
          ),
          DataColumn(
            label: const Text("G"),
            numeric: true,
            tooltip: "Goals",
            onSort: (columnIndex, _) => setState(() {
              _currentSortColumn = columnIndex;

              if (_isAscending == true) {
                _isAscending = false;
                widget.score.sort(
                  (gwA, gwB) => (gwB.goals?.getOrCrash() ?? "").compareTo(
                    (gwA.goals?.getOrCrash() ?? ""),
                  ),
                );
              } else if (_isAscending == false) {
                _isAscending = true;
                widget.score.sort(
                  (gwA, gwB) => (gwA.goals?.getOrCrash() ?? "").compareTo(
                    (gwB.goals?.getOrCrash() ?? ""),
                  ),
                );
              }
            }),
          ),
          DataColumn(
            label: const Text("A"),
            numeric: true,
            tooltip: "Assists",
            onSort: (columnIndex, _) => setState(() {
              _currentSortColumn = columnIndex;

              if (_isAscending == true) {
                _isAscending = false;
                widget.score.sort(
                  (gwA, gwB) => (gwB.assists?.getOrCrash() ?? "").compareTo(
                    (gwA.assists?.getOrCrash() ?? ""),
                  ),
                );
              } else if (_isAscending == false) {
                _isAscending = true;
                widget.score.sort(
                  (gwA, gwB) => (gwA.assists?.getOrCrash() ?? "").compareTo(
                    (gwB.assists?.getOrCrash() ?? ""),
                  ),
                );
              }
            }),
          ),
          DataColumn(
            label: const Text("C"),
            numeric: true,
            tooltip: "Cleansheet",
            onSort: (columnIndex, _) => setState(() {
              _currentSortColumn = columnIndex;

              if (_isAscending == true) {
                _isAscending = false;
                widget.score.sort(
                  (gwA, gwB) => (gwB.cleansheet?.getOrCrash() ?? "").compareTo(
                    (gwA.cleansheet?.getOrCrash() ?? ""),
                  ),
                );
              } else if (_isAscending == false) {
                _isAscending = true;
                widget.score.sort(
                  (gwA, gwB) => (gwA.cleansheet?.getOrCrash() ?? "").compareTo(
                    (gwB.cleansheet?.getOrCrash() ?? ""),
                  ),
                );
              }
            }),
          ),
          DataColumn(
            label: const Text("Y"),
            numeric: true,
            tooltip: "Yellows",
            onSort: (columnIndex, _) => setState(() {
              _currentSortColumn = columnIndex;

              if (_isAscending == true) {
                _isAscending = false;
                widget.score.sort(
                  (gwA, gwB) => (gwB.yellows?.getOrCrash() ?? "").compareTo(
                    (gwA.yellows?.getOrCrash() ?? ""),
                  ),
                );
              } else if (_isAscending == false) {
                _isAscending = true;
                widget.score.sort(
                  (gwA, gwB) => (gwA.yellows?.getOrCrash() ?? "").compareTo(
                    (gwB.yellows?.getOrCrash() ?? ""),
                  ),
                );
              }
            }),
          ),
          DataColumn(
            label: const Text("R"),
            numeric: true,
            tooltip: "Red",
            onSort: (columnIndex, _) => setState(() {
              _currentSortColumn = columnIndex;

              if (_isAscending == true) {
                _isAscending = false;
                widget.score.sort(
                  (gwA, gwB) => (gwB.reds?.getOrCrash() ?? "").compareTo(
                    (gwA.reds?.getOrCrash() ?? ""),
                  ),
                );
              } else if (_isAscending == false) {
                _isAscending = true;
                widget.score.sort(
                  (gwA, gwB) => (gwA.reds?.getOrCrash() ?? "").compareTo(
                    (gwB.reds?.getOrCrash() ?? ""),
                  ),
                );
              }
            }),
          ),
          DataColumn(
            label: const Text("PM"),
            numeric: true,
            tooltip: "Penalities Missed",
            onSort: (columnIndex, _) => setState(() {
              _currentSortColumn = columnIndex;

              if (_isAscending == true) {
                _isAscending = false;
                widget.score.sort(
                  (gwA, gwB) =>
                      (gwB.penalitiesMissed?.getOrCrash() ?? "").compareTo(
                    (gwA.penalitiesMissed?.getOrCrash() ?? ""),
                  ),
                );
              } else if (_isAscending == false) {
                _isAscending = true;
                widget.score.sort(
                  (gwA, gwB) =>
                      (gwA.penalitiesMissed?.getOrCrash() ?? "").compareTo(
                    (gwB.penalitiesMissed?.getOrCrash() ?? ""),
                  ),
                );
              }
            }),
          ),
          DataColumn(
            label: const Text("PS"),
            numeric: true,
            tooltip: "Penalities Saved",
            onSort: (columnIndex, _) => setState(() {
              _currentSortColumn = columnIndex;

              if (_isAscending == true) {
                _isAscending = false;
                widget.score.sort(
                  (gwA, gwB) =>
                      (gwB.penalitiesSaved?.getOrCrash() ?? "").compareTo(
                    (gwA.penalitiesSaved?.getOrCrash() ?? ""),
                  ),
                );
              } else if (_isAscending == false) {
                _isAscending = true;
                widget.score.sort(
                  (gwA, gwB) =>
                      (gwA.penalitiesSaved?.getOrCrash() ?? "").compareTo(
                    (gwB.penalitiesSaved?.getOrCrash() ?? ""),
                  ),
                );
              }
            }),
          ),
          DataColumn(
            label: const Text("S"),
            numeric: true,
            tooltip: "Saves",
            onSort: (columnIndex, _) => setState(() {
              _currentSortColumn = columnIndex;

              if (_isAscending == true) {
                _isAscending = false;
                widget.score.sort(
                  (gwA, gwB) => (gwB.saves?.getOrCrash() ?? "").compareTo(
                    (gwA.saves?.getOrCrash() ?? ""),
                  ),
                );
              } else if (_isAscending == false) {
                _isAscending = true;
                widget.score.sort(
                  (gwA, gwB) => (gwA.saves?.getOrCrash() ?? "").compareTo(
                    (gwB.saves?.getOrCrash() ?? ""),
                  ),
                );
              }
            }),
          ),
          DataColumn(
            label: const Text("OG"),
            numeric: true,
            tooltip: "Own Goals",
            onSort: (columnIndex, _) => setState(() {
              _currentSortColumn = columnIndex;

              if (_isAscending == true) {
                _isAscending = false;
                widget.score.sort(
                  (gwA, gwB) => (gwB.ownGoal?.getOrCrash() ?? "").compareTo(
                    (gwA.ownGoal?.getOrCrash() ?? ""),
                  ),
                );
              } else if (_isAscending == false) {
                _isAscending = true;
                widget.score.sort(
                  (gwA, gwB) => (gwA.ownGoal?.getOrCrash() ?? "").compareTo(
                    (gwB.ownGoal?.getOrCrash() ?? ""),
                  ),
                );
              }
            }),
          ),
        ],
        rows: List.generate(widget.score.length, (index) {
          return DataRow(
            selected: index % 2 == 0 ? true : false,
            cells: [
              DataCell(
                Text(widget.score[index].gameweek.getOrCrash()),
              ),
              DataCell(
                Text(widget.score[index].fantasyScore?.getOrCrash() ?? ""),
              ),
              DataCell(
                Text(widget.score[index].minutesPlayed?.getOrCrash() ?? ""),
              ),
              DataCell(
                Text(widget.score[index].goals?.getOrCrash() ?? ""),
              ),
              DataCell(
                Text(widget.score[index].assists?.getOrCrash() ?? ""),
              ),
              DataCell(
                Text(widget.score[index].cleansheet?.getOrCrash() ?? ""),
              ),
              DataCell(
                Text(widget.score[index].yellows?.getOrCrash() ?? ""),
              ),
              DataCell(
                Text(widget.score[index].reds?.getOrCrash() ?? ""),
              ),
              DataCell(
                Text(widget.score[index].penalitiesMissed?.getOrCrash() ?? ""),
              ),
              DataCell(
                Text(widget.score[index].penalitiesSaved?.getOrCrash() ?? ""),
              ),
              DataCell(
                Text(widget.score[index].saves?.getOrCrash() ?? ""),
              ),
              DataCell(
                Text(widget.score[index].ownGoal?.getOrCrash() ?? ""),
              ),
            ],
          );
        }),
      ),
    );
  }
}
