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
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CustomLeaguesBloc>(context).add(
                        CustomLeaguesEvent.leavePublicLeague(
                          userId: "62960c04c1a572a276b6e08b",
                          leagueCode: leagueCode,
                        ),
                      );

                      // Close modal
                      Navigator.of(context).pop();

                      // Navigate to custom leagues page
                      Navigator.of(context).pop();
                    },
                    child: const Text("Confirm"),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
