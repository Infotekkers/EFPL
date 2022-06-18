import 'package:efpl/application/custom_leagues/custom_leagues_bloc.dart';
import 'package:efpl/application/custom_leagues/join_custom_league_form/join_custom_league_form_bloc.dart';
import 'package:efpl/domain/custom_leagues/custom_leagues.dart';
import 'package:efpl/infrastructure/custom_leagues/custom_leagues_dto.dart';
import 'package:efpl/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/custom_leagues/create_custom_league_form/create_custom_league_form_bloc.dart';

class UserCustomLeaguesView extends StatelessWidget {
  const UserCustomLeaguesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomLeaguesBloc, CustomLeaguesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.isLoading
            ? const Center(
                child: Text("Loading"),
              )
            : _buildView(state, context);
      },
    );
  }

  _buildView(state, context) {
    List userCustomLeagues = state.userCustomLeagues;

    if (userCustomLeagues.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Football is always better with friends.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                _showCreateLeagueCustomModal(context: context);
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size.fromWidth(350.0),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(24.0)),
              ),
              child: const Text(
                "Create League",
              ),
            ),
            const SizedBox(height: 10.0),
            const Text("or"),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                _showJoinLeagueCustomModal(context: context);
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size.fromWidth(350.0),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(24.0)),
              ),
              child: const Text("Join League"),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  _showCreateLeagueCustomModal(context: context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size.fromWidth(150.0),
                  ),
                ),
                child: const Text(
                  "Create League",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () {
                  _showJoinLeagueCustomModal(context: context);
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size.fromWidth(150.0),
                  ),
                ),
                child: const Text("Join League"),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "League",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                "Position",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
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

                Navigator.pushNamed(
                  context,
                  "/customLeagueOverview",
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${userCustomLeagues[index].leagueName.getOrCrash()}",
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "${userCustomLeagues[index].previousRank.getOrCrash()}",
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _showCreateLeagueCustomModal({required BuildContext context}) {
    final CreateCustomLeagueFormBloc _createCustomLeagueFormBloc =
        getIt<CreateCustomLeagueFormBloc>();

    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32.0,
              horizontal: 16.0,
            ),
            child: BlocProvider.value(
                value: _createCustomLeagueFormBloc,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create league",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                            autocorrect: false,
                            onChanged: (value) =>
                                BlocProvider.of<CreateCustomLeagueFormBloc>(
                                        context)
                                    .add(
                              CreateCustomLeagueFormEvent.leagueNameChanged(
                                  value),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CreateCustomLeagueFormBloc>(
                                      context)
                                  .add(
                                const CreateCustomLeagueFormEvent
                                    .createLeaguePressed(),
                              );
                            },
                            child: const Text("Create"),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(16.0)),
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size.fromWidth(150.0)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }

  _showJoinLeagueCustomModal({required BuildContext context}) {
    final JoinCustomLeagueFormBloc _joinCustomLeagueFormBloc =
        getIt<JoinCustomLeagueFormBloc>();

    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32.0,
              horizontal: 16.0,
            ),
            child: BlocProvider.value(
              value: _joinCustomLeagueFormBloc,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Join league",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "League Code",
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 18),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0.0,
                              horizontal: 15.0,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          autocorrect: false,
                          onChanged: (value) =>
                              BlocProvider.of<JoinCustomLeagueFormBloc>(context)
                                  .add(
                            JoinCustomLeagueFormEvent.leagueCodeChanged(value),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<JoinCustomLeagueFormBloc>(context)
                                .add(
                              const JoinCustomLeagueFormEvent
                                  .joinLeaguePressed(),
                            );
                          },
                          child: const Text("Join"),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(16.0)),
                            fixedSize: MaterialStateProperty.all<Size>(
                                const Size.fromWidth(150.0)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
