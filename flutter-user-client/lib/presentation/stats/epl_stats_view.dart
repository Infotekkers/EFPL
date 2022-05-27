import 'package:efpl/application/epl_stats/epl_stats_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:efpl/presentation/stats/widgets/epl_stats_view_body.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EPLStatsView extends StatelessWidget {
  const EPLStatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider(
          create: (context) => getIt<EPLStatsBloc>()
            ..add(const EPLStatsEvent.getEPLStats(statType: 'goals')),
          child: const EPLStatsViewBody(),
        ),
        BlocProvider(
          create: (context) => getIt<EPLStatsBloc>()
            ..add(const EPLStatsEvent.getEPLStats(statType: 'assists')),
          child: const EPLStatsViewBody(),
        ),
        BlocProvider(
          create: (context) => getIt<EPLStatsBloc>()
            ..add(const EPLStatsEvent.getEPLStats(statType: 'cleansheets')),
          child: const EPLStatsViewBody(),
        ),
        BlocProvider(
          create: (context) => getIt<EPLStatsBloc>()
            ..add(const EPLStatsEvent.getEPLStats(statType: 'yellows')),
          child: const EPLStatsViewBody(),
        ),
        BlocProvider(
          create: (context) => getIt<EPLStatsBloc>()
            ..add(const EPLStatsEvent.getEPLStats(statType: 'reds')),
          child: const EPLStatsViewBody(),
        ),
      ],
    );
  }
}
