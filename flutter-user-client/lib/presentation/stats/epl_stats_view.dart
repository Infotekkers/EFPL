import 'package:efpl/application/epl_stats/epl_stats_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EPLStatsView extends StatelessWidget {
  const EPLStatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UtilBloc _utilBloc = getIt<UtilBloc>();
    _utilBloc.add(const UtilEvent.setDefaultLocale());

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<EPLStatsBloc>()..add(const EPLStatsEvent.getEPLStats()),
        )
      ],
      child: const Text("Hello"),
    );
  }
}
