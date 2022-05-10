import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/authentication/splash_view.dart';
import 'package:efpl/presentation/core/main_tab_view.dart';
import 'package:efpl/presentation/fixtures/fixture_detail_view.dart';
import 'package:efpl/presentation/transfers/widgets/transfer_player_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final FixtureBloc _fixtureBloc = getIt<FixtureBloc>()
    ..add(
      const FixtureEvent.loadFixtures(),
    );

  final TransferBloc _transferBloc = getIt<TransferBloc>()
    ..add(
      TransferEvent.getUserPlayers(
        gameWeekId: GameWeekId(value: 1),
      ),
    );
  Map<String, Widget Function(BuildContext)> allRoutes = {
    "/": (context) => const SplashView(),
    "/home": (context) => MultiBlocProvider(
          providers: [
            // Fixtures
            BlocProvider.value(
              value: getIt<FixtureBloc>(),
            ),

            BlocProvider.value(
              value: getIt<TransferBloc>(),
            )
          ],
          child: const MainTabView(),
        ),
    "/fixtureDetails": (context) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: getIt<TransferBloc>(),
            ),
          ],
          child: const FixtureDetailView(),
        ),
    "/transfer": (context) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: getIt<TransferBloc>(),
            ),
          ],
          child: const TransferPlayerView(),
        ),
  };
}
