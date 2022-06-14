import 'package:efpl/application/auth/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) => {
        state.map(
          intial: (_) {
            print("Initial");
          },
          authorised: (_) async {
            await Future.delayed(const Duration(seconds: 1), () {
              Navigator.popAndPushNamed(context, "/home");
            });
          },
          unauthorised: (_) {
            Navigator.popAndPushNamed(context, "/sign-in");
          },
          authenticated: (_) async {
            await Future.delayed(const Duration(seconds: 1), () {
              Navigator.popAndPushNamed(context, "/home");
            });
          },
          unauthenticated: (_) {
            Navigator.popAndPushNamed(context, "/sign-in");
          },
        )
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.blue[50],
          child: Column(
            children: [
              const SizedBox(
                height: 180,
              ),

              SvgPicture.asset(
                "assets/icons/splash-image.svg",
                height: 320,
              ),
              const SizedBox(
                height: 50,
              ),
              // Title
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Text(
                    'Ethiopian Fantasy Premier League',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 26,
                          letterSpacing: 0.25,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
