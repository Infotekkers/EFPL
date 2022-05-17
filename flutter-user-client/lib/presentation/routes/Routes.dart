import 'dart:js';

import 'package:efpl/presentation/authentication/request_reset/request_reset_view.dart';
import 'package:efpl/presentation/authentication/sign_in/sign_in_view.dart';
import 'package:efpl/presentation/authentication/splash_view.dart';
import 'package:efpl/presentation/core/main_tab_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Map<String, Widget Function(BuildContext)> allRoutes = {
    "/": (context) => const SignInPage(),
    "/home": (context) => const MainTabView(),
    "/requestReset": (context) => const RequestResetPage(),
    // "/login": (context) => const SignInPage(),
  };
}
