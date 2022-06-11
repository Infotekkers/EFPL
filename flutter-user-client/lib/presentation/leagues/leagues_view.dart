import 'package:efpl/application/custom_leagues/create_custom_league_form/create_custom_league_form_bloc.dart';
import 'package:efpl/application/custom_leagues/join_custom_league_form/join_custom_league_form_bloc.dart';
import 'package:efpl/application/custom_leagues/custom_leagues_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/leagues/widgets/user_custom_leagues_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LeaguesView extends StatelessWidget {
  const LeaguesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UtilBloc _utilBloc = getIt<UtilBloc>();
    _utilBloc.add(const UtilEvent.setDefaultLocale());

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<CustomLeaguesBloc>()
            ..add(
              const CustomLeaguesEvent.getUserCustomLeagues(
                  userId: "62960c04c1a572a276b6e08b"),
            ),
        ),
        BlocProvider.value(
          value: getIt<CreateCustomLeagueFormBloc>(),
        ),
        BlocProvider.value(
          value: getIt<JoinCustomLeagueFormBloc>(),
        ),
      ],
      child: const UserCustomLeaguesView(),
    );
  }
}
