import 'package:efpl/application/custom_leagues/custom_leagues_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LeaguesView extends StatelessWidget {
  const LeaguesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UtilBloc _utilBloc = getIt<UtilBloc>();
    _utilBloc.add(const UtilEvent.setDefaultLocale());

    final CustomLeaguesBloc _customLeaguesBloc =
        BlocProvider.of<CustomLeaguesBloc>(context);

    _customLeaguesBloc.add(const CustomLeaguesEvent.getUserCustomLeagues(
        userId: '628a258d9c666191581a83f9'));

    return BlocConsumer<CustomLeaguesBloc, CustomLeaguesState>(
      listener: (context, state) => {},
      builder: (context, state) => Column(
        children: const [Text("Hello")],
      ),
    );
  }
}
