import 'package:efpl/application/leagueTable/leaguetable_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/leaguetables/widgets/leaguetable_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeagueTableView extends StatelessWidget {
  const LeagueTableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider.value(
        value: getIt<LeagueTableBloc>()
          ..add(const LeagueTableEvent.loadLeagueTable()),
      )
    ], child: const LeagueTableViewBody());
  }
}
