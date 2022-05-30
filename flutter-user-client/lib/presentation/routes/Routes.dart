import 'package:efpl/application/custom_leagues/custom_leagues_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/authentication/splash_view.dart';
import 'package:efpl/presentation/core/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class AppRouter {
  // ignore: unused_field
  final CustomLeaguesBloc _customLeaguesBloc = getIt<CustomLeaguesBloc>()
    ..add(const CustomLeaguesEvent.getUserCustomLeagues(
        userId: '628a258d9c666191581a83f9'));

  Map<String, Widget Function(BuildContext)> allRoutes = {
    "/": (context) => const SplashView(),
    "/home": (context) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: getIt<CustomLeaguesBloc>(),
            ),
          ],
          child: const MainTabView(),
        ),
  };
}
