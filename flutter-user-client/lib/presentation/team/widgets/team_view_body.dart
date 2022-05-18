import 'package:efpl/application/my_team/myteam_bloc.dart';
import 'package:efpl/presentation/core/widgets/bouncing_ball_loading_indicator.dart';
import 'package:efpl/presentation/team/widgets/positional_container_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamViewBody extends StatelessWidget {
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
        transferOptionsLoaded: (_) => Container(),
      ),
    );
  }

  _buildMyTeam(state, {highlightOptions = const []}) {
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
}
