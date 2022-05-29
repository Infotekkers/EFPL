import 'package:efpl/application/auth/auth/auth_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FixtureView extends StatelessWidget {
  const FixtureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UtilBloc _utilBloc = getIt<UtilBloc>();
    _utilBloc.add(const UtilEvent.setDefaultLocale());

    return Center(
      child: Text(
        "Fixture",
      ),
    );
  }
}
