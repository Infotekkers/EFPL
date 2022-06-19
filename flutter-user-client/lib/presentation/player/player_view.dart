import 'package:efpl/application/player/player_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/core/widgets/bouncing_ball_loading_indicator.dart';
import 'package:efpl/presentation/core/widgets/no_connection_widget.dart';
import 'package:efpl/presentation/player/widgets/player_overview.dart';
import 'package:efpl/presentation/player/widgets/player_stats.dart';
import 'package:efpl/services/global_vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerId = ModalRoute.of(context)!.settings.arguments as int;

    return BlocProvider(
      create: (context) =>
          getIt<PlayerBloc>()..add(PlayerEvent.getPlayer(playerId.toString())),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            strings(context).playerInfo,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          iconTheme: IconThemeData(color: Colors.blue[900]),
          titleTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.blue[900],
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
          backgroundColor: Colors.blue[50],
        ),
        body: BlocConsumer<PlayerBloc, PlayerState>(
          listener: (_, state) {},
          builder: (context, state) => state.map(
            initial: (_) => Container(),
            loadInProgress: (_) => const BouncingBallLoadingIndicator(),
            loadSuccess: (state) => Container(
              color: Colors.blue[50],
              child: ListView(
                children: [
                  PlayerOverview(state: state),
                  PlayerStats(state: state),
                ],
              ),
            ),
            loadFailure: (state) => Transform.scale(
              scale: 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NoConnectionWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: OutlinedButton(
                      onPressed: () => BlocProvider.of<PlayerBloc>(context)
                          .add(PlayerEvent.getPlayer(101.toString())),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blue[400],
                      ),
                      child: const Text("Retry"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
