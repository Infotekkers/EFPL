import 'package:efpl/presentation/authentication/register/register_view.dart';
import 'package:efpl/presentation/authentication/request_reset/request_reset_view.dart';
import 'package:efpl/presentation/authentication/sign_in/sign_in_view.dart';
import 'package:efpl/presentation/authentication/splash_view.dart';
import 'package:efpl/presentation/core/main_tab_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Map<String, Widget Function(BuildContext)> allRoutes = {
    "/": (context) => const SplashView(),
    "/home": (context) => const MainTabView(),
    "/request-reset": (context) => const RequestResetPage(),
    "/sign-in": (context) => const SignInPage(),
    "/register": (context) => const RegisterPage(),
  };
}
