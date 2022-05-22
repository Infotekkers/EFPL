import 'package:efpl/application/fixture/fixture_bloc.dart';

import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/authentication/splash_view.dart';
import 'package:efpl/presentation/core/main_tab_view.dart';
import 'package:efpl/presentation/fixtures/fixture_detail_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  // ignore: unused_field
  final FixtureBloc _fixtureBloc = getIt<FixtureBloc>()
    ..add(
      const FixtureEvent.loadFixtures(),
    );

  Map<String, Widget Function(BuildContext)> allRoutes = {
    "/": (context) => const SplashView(),
    "/home": (context) => MultiBlocProvider(
          providers: [
            // Fixtures
            BlocProvider.value(
              value: getIt<FixtureBloc>(),
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
  };
}
