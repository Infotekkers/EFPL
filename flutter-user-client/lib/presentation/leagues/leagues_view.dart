import 'package:efpl/application/util/util_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LeaguesView extends StatelessWidget {
  const LeaguesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UtilBloc, UtilState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
          child: Text(
            AppLocalizations.of(context)!.league,
          ),
        );
      },
    );
  }
}
