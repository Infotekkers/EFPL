import 'package:efpl/presentation/authentication/register/register_view.dart';
import 'package:efpl/presentation/authentication/request_reset/request_reset_view.dart';
import 'package:efpl/presentation/authentication/sign_in/sign_in_view.dart';
import 'package:efpl/presentation/authentication/splash_view.dart';
import 'package:efpl/presentation/core/main_tab_view.dart';
import 'package:efpl/presentation/efpl_stats/efpl_stats_dream_team_view.dart';
import 'package:efpl/presentation/efpl_stats/efpl_stats_main_view.dart';
import 'package:efpl/presentation/player/player_view.dart';
import 'package:efpl/presentation/team/team_view.dart';
import 'package:efpl/presentation/fixtures/fixture_detail_view.dart';
import 'package:efpl/presentation/transfers/initial_transfer_view.dart';
import 'package:efpl/presentation/transfers/widgets/confirm_transfers_view.dart';
import 'package:efpl/presentation/transfers/widgets/transfer_list_view.dart';
import 'package:efpl/presentation/watch_list/watch_list_view_main.dart';

import 'package:flutter/material.dart';

class AppRouter {
  // final UtilBloc _utilBloc = getIt<UtilBloc>()
  //   ..add(
  //     const UtilEvent.setDefaultLocale(),
  //   );

  Map<String, Widget Function(BuildContext)> allRoutes = {
    "/": (context) => const SplashView(),
    "/team": (context) => const TeamView(),
    "/player": (context) => const PlayerView(),
    "/home": (context) => const MainTabView(),
    "/fixtureDetails": (context) => const FixtureDetailView(),
    "/transfer/initial": (context) => const InitialTransferPage(),
    "/transfer": (context) => const TransferPlayerView(),
    "/transfer/confirm": (context) => const ConfirmTransfersPage(),
    "/request-reset": (context) => const RequestResetPage(),
    "/sign-in": (context) => const SignInPage(),
    "/register": (context) => const RegisterPage(),
    "/efpl": (context) => const EFPLStatsPage(),
    "/efpl/dreamTeam": (context) => const EFPLStatsDreamTeam(),
    "/watchList": (context) => const WatchListPage(),
  };
}
