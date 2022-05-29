import 'package:efpl/application/auth/authentication/auth_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/authentication/register/register_view.dart';
import 'package:efpl/presentation/authentication/sign_in/sign_in_view.dart';
import 'package:efpl/presentation/core/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) => {
        state.map(
          intial: (_) {},
          authenticated: (_) {
            Navigator.popAndPushNamed(context, "/home");
          },
          unauthenticated: (_) {
            Navigator.popAndPushNamed(context, "/sign-in");
          },
        )
      },
      child: const Scaffold(
        body: Center(
          child: Text('EFPL'),
        ),
      ),
    );
  }
}
