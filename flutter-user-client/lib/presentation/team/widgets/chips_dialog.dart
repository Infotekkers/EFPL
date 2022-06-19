import 'package:efpl/application/my_team/myteam_bloc.dart';
import 'package:efpl/domain/my_team/value_objects.dart' as team_vo;
import 'package:efpl/services/global_vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChipsDialog extends StatelessWidget {
  final team_vo.AvailableChips availableChips;
  const ChipsDialog({Key? key, required this.availableChips}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(strings(context).chips),
      titleTextStyle: TextStyle(
        color: Colors.blue[900],
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
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
              Text(strings(context).tc)
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
              Text(strings(context).bb)
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
                child: const Icon(Icons.av_timer),
              ),
              Text(strings(context).fh)
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
                child: const Icon(Icons.fast_rewind),
              ),
              Text(strings(context).wc)
            ],
          ),
        ],
      ),
    );
  }
}
