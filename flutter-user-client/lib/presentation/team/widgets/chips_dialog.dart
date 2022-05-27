import 'package:efpl/application/my_team/myteam_bloc.dart';
import 'package:efpl/domain/my_team/value_objects.dart' as team_vo;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChipsDialog extends StatelessWidget {
  final team_vo.AvailableChips availableChips;
  const ChipsDialog({Key? key, required this.availableChips}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Chips"),
      content: Wrap(
        direction: Axis.vertical,
        spacing: 10.0,
        children: [
          Wrap(
            direction: Axis.horizontal,
            spacing: 4.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (availableChips
                      .getOrCrash()
                      .contains(team_vo.Chip("TC"))) {
                    BlocProvider.of<MyTeamBloc>(context)
                        .add(MyTeamEvent.chipPlayed(team_vo.Chip("TC")));
                    Navigator.pop(context);
                  }
                },
                child: const Icon(Icons.adjust_sharp),
              ),
              const Text("Triple Captain")
            ],
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 4.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (availableChips
                      .getOrCrash()
                      .contains(team_vo.Chip("BB"))) {
                    BlocProvider.of<MyTeamBloc>(context)
                        .add(MyTeamEvent.chipPlayed(team_vo.Chip("BB")));
                    Navigator.pop(context);
                  }
                },
                child: const Icon(Icons.trending_up_rounded),
              ),
              const Text("Bench Boost")
            ],
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 4.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (availableChips
                      .getOrCrash()
                      .contains(team_vo.Chip("FH"))) {
                    BlocProvider.of<MyTeamBloc>(context)
                        .add(MyTeamEvent.chipPlayed(team_vo.Chip("FH")));
                    Navigator.pop(context);
                  }
                },
                child: const Icon(Icons.adjust_sharp),
              ),
              const Text("Free Hit")
            ],
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 4.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (availableChips
                      .getOrCrash()
                      .contains(team_vo.Chip("WC"))) {
                    BlocProvider.of<MyTeamBloc>(context)
                        .add(MyTeamEvent.chipPlayed(team_vo.Chip("WC")));
                    Navigator.pop(context);
                  }
                },
                child: const Icon(Icons.adjust_sharp),
              ),
              const Text("Wildcard")
            ],
          ),
        ],
      ),
    );
  }
}
