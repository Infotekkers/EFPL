import 'package:efpl/application/my_team/myteam_bloc.dart';
import 'package:efpl/presentation/core/widgets/bouncing_ball_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyTeamBloc, MyTeamState>(
      listener: (_, __) => {},
      builder: (context, state) => state.map(
        initial: (_) => Container(),
        loadFailure: (_) => Container(),
        loadInProgress: (_) => const BouncingBallLoadingIndicator(),
        loadSuccess: (state) => Column(
          children: [
            PositionalContainerWidget(
              position: 'gk',
              players: state.myTeam.players['gk'].getOrCrash(),
            ),
            PositionalContainerWidget(
              position: 'def',
              players: state.myTeam.players['def'].getOrCrash(),
            ),
            PositionalContainerWidget(
              position: 'mid',
              players: state.myTeam.players['mid'].getOrCrash(),
            ),
            PositionalContainerWidget(
              position: 'att',
              players: state.myTeam.players['att'].getOrCrash(),
            ),
            PositionalContainerWidget(
              position: 'sub',
              players: state.myTeam.players['sub'].getOrCrash(),
            ),
          ],
        ),
        saved: (_) => Container(),
        transferApproved: (_) => Container(),
        transferOptionsLoaded: (_) => Container(),
      ),
    );
  }
}

class PositionalContainerWidget extends StatelessWidget {
  final String position;
  final Map<String, dynamic> players;
  const PositionalContainerWidget({
    Key? key,
    required this.position,
    required this.players,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> playerIds = players.keys.toList();

    return SizedBox(
      height: 100,
      child: ListView.builder(
          itemCount: playerIds.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) => Text(
                players[playerIds[index]]['position'],
                textDirection: TextDirection.ltr,
              )),
    );
  }
}
