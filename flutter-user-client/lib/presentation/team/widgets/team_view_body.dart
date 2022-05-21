import 'package:efpl/application/my_team/myteam_bloc.dart';
import 'package:efpl/presentation/core/widgets/bouncing_ball_loading_indicator.dart';
import 'package:efpl/presentation/team/widgets/positional_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamViewBody extends StatelessWidget {
  const TeamViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyTeamBloc, MyTeamState>(
      listener: (_, state) => {
        state.maybeMap(
            loadFailure: (state) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Check Your Connection")));
            },
            saved: (state) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Team Saved")));
            },
            orElse: () {})
      },
      builder: (context, state) => state.map(
        initial: (_) => Container(),
        loadFailure: (_) => Container(),
        loadInProgress: (_) => const BouncingBallLoadingIndicator(),
        loadSuccess: (state) => _buildMyTeam(state),
        saved: (_) => Container(),
        transferApproved: (_) => Container(),
        transferOptionsLoaded: (_) => _highlightMyTeam(state),
      ),
    );
  }

  _buildMyTeam(state) {
    return Column(
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
    );
  }

  _highlightMyTeam(state) {
    return Column(
      children: [
        PositionalContainerWidget(
          position: 'gk',
          players: state.myTeam.players['gk'].getOrCrash(),
          validOptions: state.validOptions,
        ),
        PositionalContainerWidget(
          position: 'def',
          players: state.myTeam.players['def'].getOrCrash(),
          validOptions: state.validOptions,
        ),
        PositionalContainerWidget(
          position: 'mid',
          players: state.myTeam.players['mid'].getOrCrash(),
          validOptions: state.validOptions,
        ),
        PositionalContainerWidget(
          position: 'att',
          players: state.myTeam.players['att'].getOrCrash(),
          validOptions: state.validOptions,
        ),
        PositionalContainerWidget(
          position: 'sub',
          players: state.myTeam.players['sub'].getOrCrash(),
          validOptions: state.validOptions,
        ),
      ],
    );
  }
}
