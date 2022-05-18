import 'package:efpl/presentation/authentication/splash_view.dart';
import 'package:efpl/presentation/core/main_tab_view.dart';
import 'package:efpl/presentation/team/team_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Map<String, Widget Function(BuildContext)> allRoutes = {
    "/": (context) => const SplashView(),
    "/home": (context) => const MainTabView(),
    "/team": (context) => const TeamView(),
  };
}
