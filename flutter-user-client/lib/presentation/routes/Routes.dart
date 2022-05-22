import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/application/transfer/transfer_bloc.dart';

import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/authentication/splash_view.dart';
import 'package:efpl/presentation/core/main_tab_view.dart';
import 'package:efpl/presentation/fixtures/fixture_detail_view.dart';
import 'package:efpl/presentation/transfers/initial_transfer_view.dart';
import 'package:efpl/presentation/transfers/widgets/confirm_transfers_view.dart';
import 'package:efpl/presentation/transfers/widgets/transfer_list_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  // ignore: unused_field
  final FixtureBloc _fixtureBloc = getIt<FixtureBloc>()
    ..add(
      const FixtureEvent.loadFixtures(),
    );

  final TransferBloc _transferBloc = getIt<TransferBloc>()
    ..add(
      const TransferEvent.getUserPlayers(),
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
            ),
          ],
          child: const MainTabView(),
        ),
    "/fixtureDetails": (context) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: getIt<FixtureBloc>(),
            ),
          ],
          child: const FixtureDetailView(),
        ),
    "/transfer/initial": (context) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: getIt<TransferBloc>(),
            ),
          ],
          child: const InitialTransferPage(),
        ),
    "/transfer": (context) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: getIt<TransferBloc>(),
            ),
          ],
          child: const TransferPlayerView(),
        ),
    "/transfer/confirm": (context) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: getIt<TransferBloc>(),
            ),
          ],
          child: const ConfirmTransfersPage(),
        ),
  };
}
