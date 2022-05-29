import 'package:efpl/application/epl_stats/epl_stats_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/authentication/splash_view.dart';
import 'package:efpl/presentation/core/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final _eplStatsBloc = getIt<EPLStatsBloc>()
    ..add(const EPLStatsEvent.getEplStats());

  Map<String, Widget Function(BuildContext)> allRoutes = {
    "/": (context) => const SplashView(),
    "/home": (context) => MultiBlocProvider(providers: [
          BlocProvider.value(
            value: getIt<EPLStatsBloc>(),
          ),
        ], child: const MainTabView()),
  };
}
