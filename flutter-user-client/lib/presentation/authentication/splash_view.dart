import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> splashScreenScaffoldScreen =
        GlobalKey<ScaffoldState>();
    return MaterialApp(
      home: Scaffold(
        key: splashScreenScaffoldScreen,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                AppLocalizations.of(context)!.helloWorld,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: 100,
              color: Colors.blue,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/home");
                },
                child: Text(
                  AppLocalizations.of(context)!.login,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
