import 'package:efpl/domain/league_table/league_table.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/authentication/splash_view.dart';
import 'package:efpl/presentation/core/main_tab_view.dart';
import 'package:efpl/presentation/leaguetables/leaguetable_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:efpl/application/leagueTable/leaguetable_bloc.dart';

class AppRouter {
  // ignore: unused_field
  final LeagueTableBloc _leagueTableBloc = getIt<LeagueTableBloc>()
    ..add(
      const LeagueTableEvent.loadLeagueTable(),
    );
  Map<String, Widget Function(BuildContext)> allRoutes = {
    "/": (context) => const SplashView(),
    "/home": (context) => const MainTabView(),
    "/EPLeagueTable": (context) => MultiBlocProvider(providers: [
          BlocProvider.value(value: getIt<LeagueTableBloc>()),
        ], child: const LeagueTableView())
  };
}
