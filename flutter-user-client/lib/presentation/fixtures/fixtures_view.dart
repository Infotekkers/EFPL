import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/fixtures/widgets/fixture_widget.dart';
import 'package:efpl/services/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FixturesView extends StatelessWidget {
  const FixturesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get The bloc value from the provider
    final FixtureBloc _fixtureBloc = BlocProvider.of<FixtureBloc>(context);

    return BlocConsumer<FixtureBloc, FixtureState>(
      listener: (context, state) {
        state.valueFailureOrSuccess.fold(
          () {},
          (either) {
            either.fold(
              (failure) {
                failure[1].maybeMap(
                  // Connection issues
                  noConnection: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "No Connection!",
                      message:
                          "Could not contact the server. Please check your connection!",
                      snackBarType: "warning",
                    );
                  },
                  socketError: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "No Connection!",
                      message:
                          "Could not contact the server. Please check your connection!",
                      snackBarType: "warning",
                    );
                  },
                  handShakeError: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "No Connection!",
                      message:
                          "Could not contact the server. Please check your connection!",
                      snackBarType: "warning",
                    );
                  },

                  // token issues
                  unauthorized: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Please Login!",
                      message: "Could not verify. Please login and try again!",
                      snackBarType: "warning",
                    );
                  },
                  unauthenticated: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Please Login!",
                      message: "Could not verify. Please login and try again!",
                      snackBarType: "warning",
                    );
                  },
                  unexpectedError: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Something went wrong!",
                      message: "Something went wrong. Please try again!",
                      snackBarType: "warning",
                    );
                  },

                  hiveError: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Caching Disabled!",
                      message: "Something went wrong. Please try again!",
                      snackBarType: "warning",
                    );
                  },

                  orElse: () {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Something went wrong.",
                      message: "Something went wrong. Try again!",
                      snackBarType: "error",
                    );
                  },
                );
              },
              (_) {},
            );
          },
        );
      },
      builder: (context, state) {
        var allFixtures = [state.allFixtures];
        if (state.allFixtures.isNotEmpty) {
          allFixtures = formatByDate(state.allFixtures);
        }

        return LiquidPullToRefresh(
          onRefresh: () async {
            getIt<FixtureBloc>().add(
              const FixtureEvent.loadFixtures(),
            );
          },
          height: 60,
          showChildOpacityTransition: false,
          animSpeedFactor: 2,
          color: ConstantColors.primary_900,
          child: state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Container(
                    color: Colors.blue[50],
                    child: Column(
                      children: [
                        // Gw controller
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 12),
                          // margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  _fixtureBloc.add(
                                    const FixtureEvent.decreaseGameWeek(),
                                  );
                                },
                                child: const Icon(Icons.arrow_back_ios),
                              ),
                              Text(AppLocalizations.of(context)!.gameWeek +
                                  " " +
                                  state.gameWeekId.toString()),
                              InkWell(
                                onTap: () {
                                  _fixtureBloc.add(
                                    const FixtureEvent.increaseGameWeek(),
                                  );
                                },
                                child: const Icon(Icons.arrow_forward_ios),
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: ConstantColors.neutral_300,
                          height: MediaQuery.of(context).size.height - 60,
                          child: state.allFixtures.length < 2
                              ? Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 250, 0, 0),
                                  child: const Text("No Fixtures"))
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: allFixtures.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    List<Fixture> fixture = allFixtures[index];
                                    var date = '';
                                    if (fixture.isNotEmpty) {
                                      date = formatMatchDate(fixture[0]);
                                    }

                                    return Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 24, 0, 1),
                                          child: Text(
                                            date,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Column(
                                          children: List.generate(
                                            fixture.length,
                                            (index) {
                                              return Container(
                                                color: index % 2 == 0
                                                    ? Colors.white
                                                    : (Colors.blue[50]),
                                                child: FixtureWidget(
                                                  fixture: fixture[index],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
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

List<List<Fixture>> formatByDate(List<Fixture> allFixtures) {
  List<List<Fixture>> formattedFixtures = [];

  List<dynamic> allPossibleDates = [];

  // get all possible dates
  for (var i = 0; i < allFixtures.length; i++) {
    var schedule = allFixtures[i].schedule.value.fold(
          (l) => '',
          (r) => r,
        );

    schedule = schedule.toString().split("T")[0];

    if (allPossibleDates.contains(schedule) == false) {
      allPossibleDates.add(schedule);
    }
  }

  for (var i = 0; i < allPossibleDates.length; i++) {
    List<Fixture> currentDateFixtures = allFixtures.where((fixture) {
      var schedule = fixture.schedule.value.fold((l) => '', (r) => r);
      schedule = schedule.split("T")[0];
      return schedule == allPossibleDates[i];
    }).toList();

    formattedFixtures.add(currentDateFixtures);
  }

  return formattedFixtures;
}

String formatMatchDate(Fixture fixture) {
  final List<String> monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  final schedule = fixture.schedule.value.fold(
    (l) => '',
    (r) => r,
  );

  final dateInfo = schedule.toString().split("T")[0].split("-");

  return monthNames[int.parse(dateInfo[1]) - 1].toString() +
      ' ' +
      dateInfo[2] +
      ' , ' +
      dateInfo[0];
}
