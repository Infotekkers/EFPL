import 'package:efpl/application/custom_leagues/custom_leagues_bloc.dart';
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

  final String customLeagueCode =
      state.customLeaguesInfo.leagueCode.getOrCrash();

  return Scaffold(
    appBar: AppBar(
      title: Text(state.customLeaguesInfo.leagueName.getOrCrash()),
      actions: [
        TextButton(
          onPressed: () {
            _showLeaveConfirmationModal(
              context: context,
              leagueCode: state.customLeaguesInfo.leagueCode.getOrCrash(),
            );
          },
          child: const Text(
            "Leave",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "League Code",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  customLeagueCode,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Team name",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                "Points",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: ListView.builder(
              itemCount: customLeagueMembers.length,
              shrinkWrap: true,
              itemBuilder: (_, index) => Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${customLeagueMembers[index]["memberTeamName"]}",
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "${customLeagueMembers[index]["memberPoints"]}",
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

_showLeaveConfirmationModal({
  required BuildContext context,
  required String leagueCode,
}) {
  showModalBottomSheet(
    context: context,
    builder: (builder) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32.0,
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              const Text(
                "Are you sure you want to leave?",
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: 150.0,
                      child: const Text(
                        "Cancel",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<CustomLeaguesBloc>(context).add(
                        CustomLeaguesEvent.leavePublicLeague(
                          userId: "62960c04c1a572a276b6e08b",
                          leagueCode: leagueCode,
                        ),
                      );

                      BlocProvider.of<CustomLeaguesBloc>(context).add(
                        const CustomLeaguesEvent.getUserCustomLeagues(
                            userId: "62960c04c1a572a276b6e08b"),
                      );

                      // Close modal
                      Navigator.of(context).pop();

                      // Navigate to custom leagues page
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: 150.0,
                      child: const Text(
                        "Confirm",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: const Color(0xFF38BDF8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
