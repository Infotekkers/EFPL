import 'package:efpl/application/my_team/myteam_bloc.dart';
import 'package:efpl/presentation/core/widgets/bouncing_ball_loading_indicator.dart';
import 'package:efpl/presentation/team/widgets/chips_dialog.dart';
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
        loadSuccess: (state) => _buildView(state, context),
        saved: (_) => Container(),
        transferApproved: (state) => _buildView(state, context, changed: true),
        transferOptionsLoaded: (state) =>
            _buildView(state, context, highlight: true),
        captainChangeSuccess: (syaye) =>
            _buildView(state, context, changed: true),
        viceCaptainChangeSuccess: (_) =>
            _buildView(state, context, changed: true),
        chipPlayedSuccess: (state) => _buildView(state, context,
            changed: true,
            informational: state.myTeam.activeChip.getOrCrash() +
                "selected. Save team to confirm"),
        chipPlayedFailure: (state) => _buildView(state, context),
      ),
    );
  }

  _buildView(state, context,
      {changed = false, highlight = false, informational = ""}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Column(
            children: [
              highlight ? _highlightMyTeam(state) : _buildMyTeam(state),
              _buildActionBtns(changed, context, state),
            ],
          ),
          ElevatedButton(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => BlocProvider.value(
                value: BlocProvider.of<MyTeamBloc>(context),
                child: ChipsDialog(availableChips: state.myTeam.availableChips),
              ),
            ),
            child: const Icon(Icons.child_care_sharp),
          ),
          Positioned(child: Text(informational)),
        ],
      ),
    );
  }

  _buildMyTeam(state) {
    return Expanded(
      child: Column(
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
    );
  }

  _highlightMyTeam(state) {
    return Expanded(
      child: Column(
        children: [
          PositionalContainerWidget(
            position: 'gk',
            players: state.myTeam.players['gk'].getOrCrash(),
            validOptions: state.validOptions,
            toBeTransferredOut: state.playerId,
          ),
          PositionalContainerWidget(
            position: 'def',
            players: state.myTeam.players['def'].getOrCrash(),
            validOptions: state.validOptions,
            toBeTransferredOut: state.playerId,
          ),
          PositionalContainerWidget(
            position: 'mid',
            players: state.myTeam.players['mid'].getOrCrash(),
            validOptions: state.validOptions,
            toBeTransferredOut: state.playerId,
          ),
          PositionalContainerWidget(
            position: 'att',
            players: state.myTeam.players['att'].getOrCrash(),
            validOptions: state.validOptions,
            toBeTransferredOut: state.playerId,
          ),
          PositionalContainerWidget(
            position: 'sub',
            players: state.myTeam.players['sub'].getOrCrash(),
            validOptions: state.validOptions,
            toBeTransferredOut: state.playerId,
          ),
        ],
      ),
    );
  }

  _buildActionBtns(changed, context, state) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 50.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => changed
                ? BlocProvider.of<MyTeamBloc>(context).add(
                    const MyTeamEvent.loadMyTeam(
                        "623b101b9a85861e924388dd", "1"))
                : null,
            style: TextButton.styleFrom(
                primary: changed ? Colors.red[400] : Colors.grey),
            child: const Text("Cancel"),
          ),
          OutlinedButton(
            onPressed: () => changed
                ? BlocProvider.of<MyTeamBloc>(context).add(
                    MyTeamEvent.saveMyTeam(
                        state.myTeam, '623b101b9a85861e924388dd'))
                : null,
            style: OutlinedButton.styleFrom(
              primary: changed ? Colors.white : Colors.grey[500],
              backgroundColor: changed ? Colors.blue[400] : Colors.grey[50],
            ),
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}