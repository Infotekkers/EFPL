import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UtilBloc _utilBloc = getIt<UtilBloc>();
    _utilBloc.add(const UtilEvent.setDefaultLocale());
    return MaterialApp(
      home: Scaffold(
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
