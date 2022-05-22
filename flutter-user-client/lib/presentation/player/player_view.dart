import 'package:efpl/application/player/player_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/player/widgets/player_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final playerId = ModalRoute.of(context)!.settings.arguments as int;

    return BlocProvider(
      create: (context) =>
          getIt<PlayerBloc>()..add(PlayerEvent.getPlayer(101.toString())),
      child: const PlayerTab(),
    );
  }
}
