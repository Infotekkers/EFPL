import 'package:efpl/application/custom_leagues/custom_leagues_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCustomLeaguesView extends StatelessWidget {
  const UserCustomLeaguesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomLeaguesBloc, CustomLeaguesState>(
      listener: (_, state) => {},
      builder: (_, state) => state.map(
        initial: (_) => Container(),
        loadFailure: (_) => const Text("Failure"),
        loadInProgress: (_) => const Text("Loading"),
        loadUserCustomLeaguesSuccess: (_) => _buildView(state, context),
      ),
    );
  }

  _buildView(state, context) {
    List userCustomLeagues = state.userCustomLeagues;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Classic Leagues"),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: userCustomLeagues.length,
              shrinkWrap: true,
              itemBuilder: (_, index) => InkWell(
                onTap: () {
                  print("tapped");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${userCustomLeagues[index].leagueName.getOrCrash()}"),
                    Text(
                        "${userCustomLeagues[index].previousRank.getOrCrash()}"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
