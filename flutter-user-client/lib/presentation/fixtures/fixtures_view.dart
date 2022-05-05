import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/fixtures/widgets/fixture_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FixturesView extends StatelessWidget {
  const FixturesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get The bloc value from the provider
    final FixtureBloc _fixtureBloc = BlocProvider.of<FixtureBloc>(context);
    final UtilBloc _utilBloc = getIt<UtilBloc>();
    _utilBloc.add(const UtilEvent.setDefaultLocale());

    return BlocConsumer<FixtureBloc, FixtureState>(
      listener: (context, state) {},
      builder: (context, state) {
        var allFixtures = [state.allFixtures];
        if (state.allFixtures.length > 0) {
          allFixtures = formatByDate(state.allFixtures);
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                // margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
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
                    Text("GameWeek  " + state.gameWeekId.toString()),
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
              state.isLoading == true
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height - 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 40,
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height - 60,
                      child: ListView.builder(
                        itemCount: allFixtures.length,
                        itemBuilder: (BuildContext context, int index) {
                          List<Fixture> fixture = allFixtures[index];
                          var date = '';
                          if (fixture.isNotEmpty) {
                            date = formatMatchDate(fixture[0]);
                          }

                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 24, 0, 2),
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
                              Container(
                                color: Colors.greenAccent,
                                child: Column(
                                  children: List.generate(
                                    fixture.length,
                                    (index) {
                                      return FixtureWidget(
                                        fixture: fixture[index],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
            ],
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

    if (!allPossibleDates.contains(schedule)) {
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
  final monthNumber = int.parse(dateInfo[1]);

  return monthNames[int.parse(dateInfo[1]) - 1].toString() +
      ' ' +
      dateInfo[2] +
      ' , ' +
      dateInfo[0];
}
