import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/application/points/points_bloc.dart';
import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/authentication/register/register_view.dart';
import 'package:efpl/presentation/authentication/request_reset/request_reset_view.dart';
import 'package:efpl/presentation/authentication/sign_in/sign_in_view.dart';
import 'package:efpl/application/epl_stats/epl_stats_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/authentication/splash_view.dart';
import 'package:efpl/presentation/core/main_tab_view.dart';
import 'package:efpl/presentation/player/player_view.dart';
import 'package:efpl/presentation/team/team_view.dart';
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

  // final TransferBloc _transferBloc = getIt<TransferBloc>()
  //   ..add(
  //     const TransferEvent.getUserPlayers(),
  //   );

  final PointsBloc _pointsBloc = getIt<PointsBloc>()
    ..add(
      const PointsEvent.getPointsInfo(),
    );

  final UtilBloc _utilBloc = getIt<UtilBloc>()
    ..add(
      const UtilEvent.setDefaultLocale(),
    );

  final _eplStatsBloc = getIt<EPLStatsBloc>()
    ..add(const EPLStatsEvent.getEplStats());

  Map<String, Widget Function(BuildContext)> allRoutes = {
    "/": (context) => const SplashView(),
    "/team": (context) => const TeamView(),
    "/player": (context) => const PlayerView(),
    "/home": (context) => MultiBlocProvider(
          providers: [
            // Fixtures
            BlocProvider.value(
              value: getIt<FixtureBloc>(),
            ),

            // BlocProvider.value(
            //   value: getIt<TransferBloc>(),
            // ),

            BlocProvider.value(
              value: getIt<PointsBloc>(),
            ),
            BlocProvider.value(
              value: getIt<UtilBloc>(),
            ),

            BlocProvider.value(
              value: getIt<EPLStatsBloc>(),
            )
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
    "/request-reset": (context) => const RequestResetPage(),
    "/sign-in": (context) => const SignInPage(),
    "/register": (context) => const RegisterPage(),
  };
}
