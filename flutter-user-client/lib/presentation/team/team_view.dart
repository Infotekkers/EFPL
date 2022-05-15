import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/services/snack_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TeamView extends StatelessWidget {
  const TeamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UtilBloc _utilBloc = getIt<UtilBloc>();
    _utilBloc.add(const UtilEvent.setDefaultLocale());
    return Center(
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.team,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
            ),
            onPressed: () {
              CustomSnackBar().showCustomSnackBar(
                showContext: context,
                headlineText: "Custom Snackbar",
                message: "Flutter snackbar with cool design is showing now!",
                snackBarType: "warning",
              );
            },
            child: const Text(
              "Show Me Snackbar",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
