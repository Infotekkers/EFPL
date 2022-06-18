import 'package:dartz/dartz.dart';
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
      listener: (context, state) {
        print("here");
        print(getIt<CreateCustomLeagueFormBloc>().state.createLeagueSuccess);

        if (state.leaveLeagueSuccess) {
        } else if (getIt<CreateCustomLeagueFormBloc>()
            .state
            .createLeagueSuccess) {
          print("success");
        }

        // state.valueFailureOrSuccess.fold(
        //   () {},
        //   (either) {
        //     either.fold(
        //       (failure) {
        //         failure.maybeMap(
        //           serverError: () {
        //             print("Server go brrrr");
        //           },
        //           networkError: () {
        //             print("Network go brrrr");
        //           },
        //           orElse: () {},
        //         );
        //       },
        //       (_) {},
        //     );
        //   },
        // );
      },
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
            InkWell(
              onTap: () {
                _showCreateLeagueCustomModal(context: context);
              },
              child: Container(
                padding: const EdgeInsets.all(24.0),
                width: 350.0,
                child: const Text(
                  "Create league",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: const Color(0xFF2698D1),
              ),
            ),
            const SizedBox(height: 10.0),
            const Text("or"),
            const SizedBox(height: 10.0),
            InkWell(
              onTap: () {
                _showJoinLeagueCustomModal(context: context);
              },
              child: Container(
                padding: const EdgeInsets.all(24.0),
                width: 350.0,
                child: const Text(
                  "Create league",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: const Color(0xFF2698D1),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  _showCreateLeagueCustomModal(context: context);
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 150.0,
                  child: const Text(
                    "Create League",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: const Color(0xFF2698D1),
                ),
              ),
              const SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  _showJoinLeagueCustomModal(context: context);
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 150.0,
                  child: const Text(
                    "Join League",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: const Color(0xFF2698D1),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                child: Container(
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
                          InkWell(
                            onTap: () {
                              BlocProvider.of<CreateCustomLeagueFormBloc>(
                                      context)
                                  .add(
                                const CreateCustomLeagueFormEvent
                                    .createLeaguePressed(),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              width: 150.0,
                              child: const Text(
                                "Create",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              color: const Color(0xFF2698D1),
                            ),
                          ),
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
                        InkWell(
                          onTap: () {
                            BlocProvider.of<JoinCustomLeagueFormBloc>(context)
                                .add(
                              const JoinCustomLeagueFormEvent
                                  .joinLeaguePressed(),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            width: 150.0,
                            child: const Text(
                              "Join",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: const Color(0xFF2698D1),
                          ),
                        ),
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
