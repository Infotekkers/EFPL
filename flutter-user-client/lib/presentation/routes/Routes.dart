// ignore_for_file: unused_field
import 'package:efpl/presentation/authentication/register/register_view.dart';
import 'package:efpl/presentation/authentication/request_reset/request_reset_view.dart';
import 'package:efpl/presentation/authentication/sign_in/sign_in_view.dart';
import 'package:efpl/presentation/authentication/splash_view.dart';
import 'package:efpl/presentation/core/main_tab_view.dart';
import 'package:efpl/presentation/core/public_home_view.dart';
import 'package:efpl/presentation/efpl_stats/efpl_stats_dream_team_view.dart';
import 'package:efpl/presentation/efpl_stats/efpl_stats_main_view.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/leaguetables/leaguetable_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:efpl/application/leagueTable/leaguetable_bloc.dart';
import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/application/points/points_bloc.dart';
import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/presentation/player/player_view.dart';
import 'package:efpl/presentation/team/team_view.dart';
import 'package:efpl/presentation/fixtures/fixture_detail_view.dart';
import 'package:efpl/presentation/transfers/initial_transfer_view.dart';
import 'package:efpl/presentation/transfers/widgets/confirm_transfers_view.dart';
import 'package:efpl/presentation/transfers/widgets/transfer_list_view.dart';
import 'package:efpl/presentation/watch_list/watch_list_view_main.dart';

import 'package:showcaseview/showcaseview.dart';

class AppRouter {
  final LeagueTableBloc _leagueTableBloc = getIt<LeagueTableBloc>()
    ..add(
      const LeagueTableEvent.loadLeagueTable(),
    );
  final FixtureBloc _fixtureBloc = getIt<FixtureBloc>()
    ..add(
      const FixtureEvent.loadFixtures(),
    );

  final TransferBloc _transferBloc = getIt<TransferBloc>()
    ..add(
      const TransferEvent.getUserPlayers(),
    );

  final PointsBloc _pointsBloc = getIt<PointsBloc>()
    ..add(
      const PointsEvent.getPointsInfo(),
    );
  //

  // final UtilBloc _utilBloc = getIt<UtilBloc>()
  //   ..add(
  //     const UtilEvent.setDefaultLocale(),
  //   );

  Map<String, Widget Function(BuildContext)> allRoutes = {
    "/": (context) => const SplashView(),
    "/public": (context) => const PublicHome(),
    "/EPLeagueTable": (context) => MultiBlocProvider(providers: [
          BlocProvider.value(value: getIt<LeagueTableBloc>()),
        ], child: const LeagueTableView()),
    "/team": (context) => const TeamView(),
    "/player": (context) => const PlayerView(),
    "/home": (context) => ShowCaseWidget(
          blurValue: 1,
          builder: Builder(
            builder: (context) => const MainTabView(),
          ),
        ),
    "/fixtureDetails": (context) => const FixtureDetailView(),
    "/transfer/initial": (context) => const InitialTransferPage(),
    "/transfer": (context) => ShowCaseWidget(
          blurValue: 1,
          builder: Builder(
            builder: (context) => const TransferPlayerView(),
          ),
        ),
    "/transfer/confirm": (context) => const ConfirmTransfersPage(),
    "/request-reset": (context) => const RequestResetPage(),
    "/sign-in": (context) => const SignInPage(),
    "/register": (context) => const RegisterPage(),
    "/efpl": (context) => const EFPLStatsPage(),
    "/efpl/dreamTeam": (context) => const EFPLStatsDreamTeam(),
    "/watchList": (context) => const WatchListPage(),
  };
}
