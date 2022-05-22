import 'package:efpl/application/player/player_bloc.dart';
import 'package:efpl/presentation/core/widgets/bouncing_ball_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerOverview extends StatelessWidget {
  const PlayerOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerBloc, PlayerState>(
      listener: (_, state) {},
      builder: (context, state) => state.map(
        initial: (_) => Container(),
        loadInProgress: (_) => const BouncingBallLoadingIndicator(),
        loadSuccess: (state) => Column(
          children: [
            Text(state.player.name.getOrCrash()),
            Text(state.player.position.getOrCrash()),
            Text(state.player.currentPrice.getOrCrash()),
            Text(state.player.availability.injuryMessage.getOrCrash()),
          ],
        ),
        loadFailure: (state) => const Text("FAIL"),
      ),
    );
  }
}
