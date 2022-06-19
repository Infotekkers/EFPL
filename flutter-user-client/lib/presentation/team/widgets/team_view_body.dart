import 'package:efpl/application/my_team/myteam_bloc.dart';
import 'package:efpl/presentation/core/widgets/auth_problem_widget.dart';
import 'package:efpl/presentation/core/widgets/bouncing_ball_loading_indicator.dart';
import 'package:efpl/presentation/core/widgets/no_connection_widget.dart';
import 'package:efpl/presentation/team/widgets/chips_dialog.dart';
import 'package:efpl/presentation/team/widgets/positional_container_widget.dart';
import 'package:efpl/services/global_vars.dart';
import 'package:efpl/services/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TeamViewBody extends StatelessWidget {
  const TeamViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyTeamBloc, MyTeamState>(
      listener: (_, state) => {
        state.maybeMap(
            loadFailure: (state) {
              CustomSnackBar().showCustomSnackBar(
                showContext: context,
                headlineText: 'Error',
                message: strings(context).checkConn,
                snackBarType: "warning",
              );
            },
            saved: (state) {
              CustomSnackBar().showCustomSnackBar(
                showContext: context,
                headlineText: 'Success',
                message: strings(context).teamSaved,
                snackBarType: "success",
              );
            },
            orElse: () {})
      },
      builder: (context, state) => state.map(
        initial: (_) => Container(),
        loadFailure: (state) => state.myTeamFailure.maybeMap(
          authError: (_) => Transform.scale(
            scale: 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthProblemWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pushNamed("/"),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue[400],
                    ),
                    child: Text(strings(context).login),
                  ),
                ),
              ],
            ),
          ),
          orElse: () => Transform.scale(
            scale: 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NoConnectionWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: OutlinedButton(
                    onPressed: () => BlocProvider.of<MyTeamBloc>(context)
                        .add(const MyTeamEvent.loadMyTeam("1")),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue[400],
                    ),
                    child: Text(strings(context).retry),
                  ),
                ),
              ],
            ),
          ),
        ),
        loadInProgress: (_) => const BouncingBallLoadingIndicator(),
        loadSuccess: (state) => _buildView(state, context),
        saved: (_) => _buildView(state, context),
        transferApproved: (state) => _buildView(state, context, changed: true),
        transferOptionsLoaded: (state) =>
            _buildView(state, context, highlight: true),
        captainChangeSuccess: (state) =>
            _buildView(state, context, changed: true),
        viceCaptainChangeSuccess: (_) =>
            _buildView(state, context, changed: true),
        chipPlayedSuccess: (state) => _buildView(state, context,
            changed: true,
            informational: (state.myTeam.activeChip
                            .getOrCrash()
                            .toLowerCase() ==
                        'tc'
                    ? strings(context).tc
                    : state.myTeam.activeChip.getOrCrash().toLowerCase() == 'bb'
                        ? strings(context).bb
                        : state.myTeam.activeChip.getOrCrash().toLowerCase() ==
                                'fh'
                            ? strings(context).fh
                            : strings(context).wc) +
                " " +
                strings(context).chipConfirmation),
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
              _buildActionBtns(changed, context, state, highlight),
            ],
          ),
          Positioned(
            top: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () => state.myTeam.activeChip.getOrCrash() == ''
                  ? showDialog(
                      context: context,
                      builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<MyTeamBloc>(context),
                        child: ChipsDialog(
                          availableChips: state.myTeam.availableChips,
                        ),
                      ),
                    )
                  : null,
              child: const Icon(MdiIcons.pokerChip),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                primary: state.myTeam.activeChip.getOrCrash() == ''
                    ? Colors.blue[400]
                    : Colors.grey[300],
                onPrimary: state.myTeam.activeChip.getOrCrash() == ''
                    ? Colors.white
                    : Colors.grey[700],
              ),
            ),
          ),
          informational != ''
              ? Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      informational,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : Container(),
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

  _buildActionBtns(changed, context, state, highlight) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 50.0,
      ),
      child: Transform.scale(
        scale: 1.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => changed || highlight
                  ? BlocProvider.of<MyTeamBloc>(context)
                      .add(const MyTeamEvent.loadMyTeam("1"))
                  : null,
              style: TextButton.styleFrom(
                  primary:
                      changed || highlight ? Colors.red[400] : Colors.grey),
              child: Text(strings(context).cancel),
            ),
            OutlinedButton(
              onPressed: () => changed
                  ? BlocProvider.of<MyTeamBloc>(context)
                      .add(MyTeamEvent.saveMyTeam(state.myTeam))
                  : null,
              style: OutlinedButton.styleFrom(
                primary: changed ? Colors.white : Colors.grey[500],
                backgroundColor: changed ? Colors.blue[400] : Colors.grey[50],
              ),
              child: Text(strings(context).save),
            ),
          ],
        ),
      ),
    );
  }
}
