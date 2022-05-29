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
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: EPLStatsViewBody(),
    );
  }
}