import 'package:cached_network_image/cached_network_image.dart';
import 'package:efpl/application/watch_list/watch_list_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/watch_list/widgets/watch_list_player_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WatchListBloc _watchListBloc = getIt<WatchListBloc>()
      ..add(
        const WatchListEvent.getUserWatchList(),
      );

    final String _baseURL = dotenv.env["API"].toString();
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: _watchListBloc)],
      child: BlocConsumer<WatchListBloc, WatchListState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<String> allTeamsNames = ["Select a Team"];
          for (var team in state.allTeams) {
            allTeamsNames.add(team['teamName']);
          }

          SfRangeValues _values =
              SfRangeValues(state.minPriceSet, state.maxPriceSet);

          return Scaffold(
            appBar: _buildAppBar(context: context),
            body: _buildMainBody(
              allPositionPlayerFiltered: state.filteredWatchListPlayers,
              context: context,
              state: state,
              watchListBloc: _watchListBloc,
              allTeams: state.allTeams,
              allTeamsNames: allTeamsNames,
              baseURL: _baseURL,
              values: _values,
            ),
          );
        },
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar({required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.blue[50],
    iconTheme: IconThemeData(color: Colors.blue[900]),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.blue[50],
    ),
    title: Text(
      AppLocalizations.of(context)!.yourWatchList,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: ConstantColors.primary_900,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.25,
          ),
    ),
    actions: [
      InkWell(
        onTap: () {
          getIt<WatchListBloc>().add(const WatchListEvent.clearUserWatchList());
        },
        child: Container(
          child: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        ),
      ),
    ],
  );
}

Widget _buildMainBody({
  required BuildContext context,
  required WatchListState state,
  required WatchListBloc watchListBloc,
  required List allTeams,
  required String baseURL,
  required List<String> allTeamsNames,
  required List allPositionPlayerFiltered,
  required SfRangeValues values,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    color: Colors.blue[50],
    child: state.isLoading == true
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : state.filteredWatchListPlayers.isEmpty == true
            ? const Center(child: Text("No Players"))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    // TOP FILTERS
                    SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          // Filter One (Team)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Container(
                              width:
                                  (MediaQuery.of(context).size.width * 0.58) -
                                      20,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ConstantColors.primary_900,
                                  width: 1.0,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: state.selectedDropDownTeamValue,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: ConstantColors.primary_900,
                                      ),
                                  onChanged: (String? newTeamName) {
                                    watchListBloc.add(
                                      WatchListEvent.setFilter(
                                        filterBy: "team",
                                        filterValue: newTeamName!,
                                      ),
                                    );
                                  },
                                  items: allTeamsNames.map((String teamName) {
                                    String finalURL = baseURL;

                                    List teamLogoList = allTeams
                                        .where((team) =>
                                            team['teamName'] == teamName)
                                        .toList();

                                    if (teamLogoList.isNotEmpty) {
                                      finalURL = finalURL +
                                          teamLogoList[0]['teamLogo'];
                                    }

                                    // TEAM FILTER DROP DOWN
                                    return DropdownMenuItem<String>(
                                      value: teamName,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 25,
                                            width: 25,
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 8, 0),
                                            child: CachedNetworkImage(
                                              imageUrl: finalURL == baseURL
                                                  ? '$baseURL/uploads/teams/placeholder_team.png'
                                                  : finalURL,
                                            ),
                                          ),
                                          Text(
                                            teamName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                  fontSize: 12,
                                                ),
                                          )
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),

                          // Filter Two (Injury)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Container(
                              width:
                                  (MediaQuery.of(context).size.width * 0.42) -
                                      20,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ConstantColors.primary_900,
                                  width: 1.0,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value:
                                      state.selectedDropDownInjuryStatusValue,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: ConstantColors.primary_900,
                                      ),
                                  onChanged: (String? injuryStatus) {
                                    watchListBloc.add(
                                      WatchListEvent.setFilter(
                                        filterBy: "injury status",
                                        filterValue: injuryStatus!,
                                      ),
                                    );
                                  },
                                  items: <String>[
                                    "All",
                                    "Available",
                                    "Unavailable"
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Bottom Filter
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          // MIN LABEL
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.minimumPrice,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 13,
                                      ),
                                ),
                                Text(
                                  state.minPriceSet.toStringAsFixed(1),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                )
                              ],
                            ),
                          ),

                          // SLIDER
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.76,
                            child: SfRangeSlider(
                              min: 3.5,
                              max: 15.0,
                              values: values,
                              interval: 0.1,
                              activeColor: ConstantColors.primary_900,
                              inactiveColor: ConstantColors.primary_400,
                              onChangeEnd: (SfRangeValues value) {
                                watchListBloc.add(
                                  const WatchListEvent.filterByPrice(),
                                );
                              },
                              onChanged: (SfRangeValues value) {
                                watchListBloc.add(
                                  WatchListEvent.setPriceFilter(
                                    minValue: value.start,
                                    maxValue: value.end,
                                  ),
                                );
                              },
                            ),
                          ),

                          // MAX LABEL
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.maximumPrice,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 13,
                                      ),
                                ),
                                Text(
                                  state.maxPriceSet.toStringAsFixed(1),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // HEADER
                    Container(
                      height: 45,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      color: ConstantColors.primary_900,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // PLAYER NAME
                          InkWell(
                            onTap: () {
                              watchListBloc.add(
                                const WatchListEvent.setSortFilter(
                                  sortBy: 'name',
                                ),
                              );
                            },
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.player,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 16,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.bold,
                                          color: ConstantColors.neutral_200,
                                        ),
                                  ),
                                  state.playerNameCurrentSortOrder == ""
                                      ? const SizedBox(
                                          height: 0,
                                          width: 0,
                                        )
                                      : state.playerNameCurrentSortOrder == "a"
                                          ? const Icon(
                                              Icons.arrow_drop_up,
                                              size: 25,
                                              color: ConstantColors.success_300,
                                            )
                                          : const Icon(
                                              Icons.arrow_drop_down,
                                              size: 25,
                                              color: ConstantColors.error_300,
                                            ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 0.55,
                            ),
                          ),

                          // PLAYER PRICE
                          InkWell(
                            onTap: () {
                              watchListBloc.add(
                                const WatchListEvent.setSortFilter(
                                  sortBy: 'price',
                                ),
                              );
                            },
                            child: SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.price,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 16,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.bold,
                                          color: ConstantColors.neutral_200,
                                        ),
                                  ),
                                  state.playerPriceCurrentSortOrder == ""
                                      ? const SizedBox(
                                          height: 0,
                                          width: 0,
                                        )
                                      : state.playerPriceCurrentSortOrder == "a"
                                          ? const Icon(
                                              Icons.arrow_drop_up,
                                              size: 25,
                                              color: ConstantColors.success_300,
                                            )
                                          : const Icon(
                                              Icons.arrow_drop_down,
                                              size: 25,
                                              color: ConstantColors.error_300,
                                            ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 0.17,
                            ),
                          ),

                          // PLAYER POINT
                          InkWell(
                            onTap: () {
                              watchListBloc.add(
                                const WatchListEvent.setSortFilter(
                                  sortBy: 'point',
                                ),
                              );
                            },
                            child: SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.points,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 16,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.bold,
                                          color: ConstantColors.neutral_200,
                                        ),
                                  ),
                                  state.playerScoreCurrentSortOrder == ""
                                      ? const SizedBox(
                                          height: 0,
                                          width: 0,
                                        )
                                      : state.playerScoreCurrentSortOrder == "a"
                                          ? const Icon(
                                              Icons.arrow_drop_up,
                                              size: 25,
                                              color: ConstantColors.success_300,
                                            )
                                          : const Icon(
                                              Icons.arrow_drop_down,
                                              size: 25,
                                              color: ConstantColors.error_300,
                                            ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 0.19,
                            ),
                          )
                        ],
                      ),
                    ),

                    ListView.builder(
                      itemCount: allPositionPlayerFiltered.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        // USER PLAYER CARD
                        return WatchListPlayerCard(
                          currentPlayer: allPositionPlayerFiltered[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
  );
}
