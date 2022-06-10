import 'package:efpl/application/custom_leagues/custom_leagues_bloc.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues.dart';
import 'package:efpl/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCustomLeaguesView extends StatelessWidget {
  const UserCustomLeaguesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomLeaguesBloc, CustomLeaguesState>(
      listener: (_, state) => {
        state.maybeMap(
          createLeagueSuccess: (state) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("League created")),
            );
          },
          loadFailure: (state) {
            const Text("Failure");
          },
          orElse: () {},
        )
      },
      builder: (_, state) => state.map(
        initial: (_) => Container(),
        loadFailure: (_) => const Text("Failure"),
        loadInProgress: (_) => const Text("Loading"),
        loadUserCustomLeaguesSuccess: (_) => _buildView(state, context),
        loadCustomLeagueInfo: (_) =>
            _buildCustomLeagueMembersView(state, context),
        createLeagueSuccess: (_) => _buildView(state, context),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  _showCustomModal(context: context);
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size.fromWidth(200.0),
                  ),
                ),
                child: const Text("Create League"),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () {
                  print("pressed");
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size.fromWidth(200.0),
                  ),
                ),
                child: const Text("Join League"),
              ),
            ],
          ),
          const Text("Custom Leagues"),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: userCustomLeagues.length,
              shrinkWrap: true,
              itemBuilder: (_, index) => InkWell(
                onTap: () {
                  BlocProvider.of<CustomLeaguesBloc>(context).add(
                    CustomLeaguesEvent.getCustomLeagueInfo(
                      leagueId: userCustomLeagues[index].leagueId.getOrCrash(),
                    ),
                  );
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

  _buildCustomLeagueMembersView(state, context) {
    CustomLeaguesInfo customLeagueInfo = state.customLeaguesInfo;
    final customLeagueMembers =
        state.customLeaguesInfo.customleagueMembers.getOrCrash();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(customLeagueInfo.leagueName.getOrCrash()),
          const SizedBox(height: 8.0),
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
    );
  }

  _showCustomModal({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "League Name",
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 18),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0.0,
                      horizontal: 15.0,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  autocorrect: false,
                ),
                ElevatedButton(
                  onPressed: () {
                    print("pressed");
                    // BlocProvider.of<CustomLeaguesBloc>(context).add(
                    //   // const CustomLeaguesEvent.createLeague(
                    //   //   leagueName: "",
                    //   ),
                    // );
                  },
                  child: const Text("Create"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
