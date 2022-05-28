import 'package:efpl/application/player/player_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/core/widgets/bouncing_ball_loading_indicator.dart';
import 'package:efpl/presentation/player/widgets/player_overview.dart';
import 'package:efpl/presentation/player/widgets/player_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: IMPORT Player ID
    // final playerId = ModalRoute.of(context)!.settings.arguments as int;

    return BlocProvider(
      create: (context) =>
          getIt<PlayerBloc>()..add(PlayerEvent.getPlayer(100454.toString())),
      child: BlocConsumer<PlayerBloc, PlayerState>(
        listener: (_, state) {},
        builder: (context, state) => state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const BouncingBallLoadingIndicator(),
          loadSuccess: (state) => Scaffold(
            appBar: AppBar(
              title: const Text("Player Information"),
            ),
            body: ListView(
              children: [
                PlayerOverview(state: state),
                PlayerStats(state: state),
              ],
            ),
          ),
          loadFailure: (state) => const Text("FAIL"),
        ),
      ),
    );
  }
}
