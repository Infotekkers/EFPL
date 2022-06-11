import 'package:efpl/application/custom_leagues/custom_leagues_bloc.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues.dart';
import 'package:efpl/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLeagueOverview extends StatelessWidget {
  const CustomLeagueOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomLeaguesBloc _customLeagusBloc = getIt<CustomLeaguesBloc>();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _customLeagusBloc),
      ],
      child: BlocConsumer<CustomLeaguesBloc, CustomLeaguesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _buildCustomLeagueMembersView(context, state);
        },
      ),
    );
  }
}

_buildCustomLeagueMembersView(context, state) {
  final List customLeagueMembers =
      state.customLeaguesInfo.customLeagueMembers.getOrCrash().toList();

  return Scaffold(
    appBar: AppBar(
      title: Text(state.customLeaguesInfo.leagueName.getOrCrash()),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: customLeagueMembers.length,
              shrinkWrap: true,
              itemBuilder: (_, index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${customLeagueMembers[index]["memberTeamName"]}"),
                  Text("${customLeagueMembers[index]["memberPoints"]}"),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
