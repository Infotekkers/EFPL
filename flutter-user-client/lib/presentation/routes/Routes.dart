import 'package:efpl/presentation/authentication/SplashView.dart';
import 'package:efpl/presentation/core/MainTabView.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Map<String, Widget Function(BuildContext)> allRoutes = {
    "/": (context) => const SplashView(),
    "/home": (context) => const MainTabView(),
  };
}
