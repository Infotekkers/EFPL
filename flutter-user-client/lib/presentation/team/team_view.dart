import 'package:efpl/application/my_team/myteam_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/team/widgets/team_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamView extends StatelessWidget {
  const TeamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider.value(
        value: getIt<MyTeamBloc>()
          ..add(const MyTeamEvent.loadMyTeam("623b101b9a85861e924388dd", "1")),
      )
    ], child: TeamViewBody());
  }
}
