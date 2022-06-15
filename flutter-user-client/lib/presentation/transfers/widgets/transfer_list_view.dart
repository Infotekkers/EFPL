import 'package:cached_network_image/cached_network_image.dart';
import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/transfers/widgets/transfer_player_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransferPlayerView extends StatefulWidget {
  const TransferPlayerView({Key? key}) : super(key: key);

  @override
  State<TransferPlayerView> createState() => _TransferPlayerViewState();
}

// Remaining In Bank
final _bankKey = GlobalKey();
// Search Bar
final _searchBarKey = GlobalKey();
// Filter by Team
final _filterByTeamKey = GlobalKey();
// Filter by Availabilty
final _filterByAvailabiltyKey = GlobalKey();
// Min Label
final _minPriceLabelKey = GlobalKey();
// Slider
final _sliderKey = GlobalKey();
// Max Label
final _maxPriceLabelKey = GlobalKey();
// Player Name Sorter
final _playerNameSorterKey = GlobalKey();
// Player Price Sorter
final _playerPriceSorterKey = GlobalKey();
// Player Point Sorter
final _playerPointSorterKey = GlobalKey();
// Player Information
final _playerCardKey = GlobalKey();

class _TransferPlayerViewState extends State<TransferPlayerView> {
  @override
  Widget build(BuildContext context) {
    final String _baseURL = dotenv.env["API"].toString();
    final TransferBloc _transferBloc = getIt<TransferBloc>();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _transferBloc,
        ),
      ],
      child: BlocConsumer<TransferBloc, TransferState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<UserPlayer> allPositionPlayers =
              state.filteredSelectedPlayerReplacements;
          List<UserPlayer> userPlayers = state.userTeam.allUserPlayers;
          // remove players in user team from list
          List<UserPlayer> allPositionPlayerFiltered = [];
          for (var i = 0; i < allPositionPlayers.length; i++) {
            List checkPlayer = userPlayers
                .where((element) =>
                    element.playerId == allPositionPlayers[i].playerId)
                .toList();

            if (checkPlayer.isEmpty) {
              allPositionPlayerFiltered.add(allPositionPlayers[i]);
            }
          }
          // get args
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          String currentTransferredPlayerId = args['currentPlayerId'];
          bool isInitial = args['isInitial'];
          List currentPlayerFilter = state.selectedPlayerReplacements
              .where((player) =>
                  player.playerId.toString() == currentTransferredPlayerId)
              .toList();
          double currentPlayerPrice = 0.0;
          if (currentPlayerFilter.isNotEmpty) {
            UserPlayer currentPlayer = currentPlayerFilter[0];
            currentPlayerPrice = currentPlayerPrice +
                currentPlayer.currentPrice.value.fold((l) => 0.0, (r) => r);
          }
          List allTeams = args['allTeams'];
          List<String> allTeamsNames = ["Select a Team"];
          for (var team in allTeams) {
            allTeamsNames.add(team['teamName']);
          }
          SfRangeValues _values =
              SfRangeValues(state.minPriceSet, state.maxPriceSet);

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: 80,
              backgroundColor: Colors.blue[50],
              foregroundColor: ConstantColors.primary_900,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.blue[50],
              ),
              title: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // TITLE
                    Text(
                      AppLocalizations.of(context)!.transferList,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.25,
                          ),
                    ),

                    // BANK INFO
                    Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.bank,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 14,
                                  ),
                        ),

                        // SPACER
                        const SizedBox(height: 0.25),

                        // PRICE INFO
                        Showcase(
                          key: _bankKey,
                          title: AppLocalizations.of(context)!.bankKeyTitle,
                          description:
                              AppLocalizations.of(context)!.bankKeyDesc,
                          shapeBorder: const CircleBorder(),
                          showcaseBackgroundColor: ConstantColors.primary_900,
                          titleTextStyle:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: ConstantColors.neutral_200,
                                    height: 1.5,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.55,
                                  ),
                          descTextStyle:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: ConstantColors.neutral_200,
                                    height: 1.5,
                                  ),
                          overlayPadding: const EdgeInsets.all(8),
                          contentPadding: const EdgeInsets.all(20),
                          child: Text(
                            (state.remainingInBank + currentPlayerPrice)
                                .toStringAsFixed(1),
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: state.remainingInBank > 0
                                          ? Colors.green
                                          : Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    setState(() {
                      ShowCaseWidget.of(context)!.startShowCase(
                        [
                          _bankKey,
                          _searchBarKey,
                          _filterByTeamKey,
                          _filterByAvailabiltyKey,
                          _minPriceLabelKey,
                          _sliderKey,
                          _maxPriceLabelKey,
                          _playerNameSorterKey,
                          _playerPriceSorterKey,
                          _playerPointSorterKey,
                          _playerCardKey,
                        ],
                      );
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 8.0, 12.0, 8.0),
                    child: Icon(Icons.help_outline),
                  ),
                )
              ],
            ),
            body: Container(
              color: Colors.blue[50],
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildSearchBarView(
                        context: context, transferBloc: _transferBloc),
                    Container(
                      child: state.isLoading
                          ? _buildLoadingView(context: context)
                          : allPositionPlayerFiltered.isEmpty
                              ? _buildNoPlayersView(context: context)
                              : _buildPlayersListView(
                                  allPositionPlayerFiltered:
                                      allPositionPlayerFiltered,
                                  context: context,
                                  state: state,
                                  transferBloc: _transferBloc,
                                  allTeams: allTeams,
                                  allTeamsNames: allTeamsNames,
                                  values: _values,
                                  baseURL: _baseURL,
                                  isInitial: isInitial,
                                ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildLoadingView({required BuildContext context}) {
  return Container(
    height: MediaQuery.of(context).size.height - 200,
    color: Colors.blue[50],
    child: const Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget _buildNoPlayersView({required BuildContext context}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height - 200,
    child: const Center(
      child: Text(
        "No Players",
      ),
    ),
  );
}

Widget _buildSearchBarView(
    {required BuildContext context, required TransferBloc transferBloc}) {
  return // SEARCH BAR
      SizedBox(
    height: 60,
    width: MediaQuery.of(context).size.width,
    child: Showcase(
      key: _searchBarKey,
      title: AppLocalizations.of(context)!.searchBarKeyTitle,
      description: AppLocalizations.of(context)!.searchBarDesc,
      shapeBorder: const CircleBorder(),
      showcaseBackgroundColor: ConstantColors.primary_900,
      titleTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: ConstantColors.neutral_200,
            height: 1.5,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.55,
          ),
      descTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: ConstantColors.neutral_200,
            height: 1.5,
          ),
      overlayPadding: const EdgeInsets.all(8),
      contentPadding: const EdgeInsets.all(20),
      child: FloatingSearchBar(
        backgroundColor: Colors.blue[50],
        backdropColor: ConstantColors.primary_900,
        hint: 'Search Here...',
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: const Duration(milliseconds: 600),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: (query) {
          transferBloc.add(TransferEvent.setSearchQuery(query: query));
        },
        // Specify a custom transition to be used for
        // animating between opened and closed stated.
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.red,
              // color: Colors.white,
              elevation: 2.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: Colors.accents.map((color) {
                  return Container(
                      height: 112, color: ConstantColors.primary_900);
                }).toList(),
              ),
            ),
          );
        },
      ),
    ),
  );
}

Widget _buildPlayersListView({
  required BuildContext context,
  required TransferState state,
  required TransferBloc transferBloc,
  required List allTeams,
  required String baseURL,
  required List<String> allTeamsNames,
  required List allPositionPlayerFiltered,
  required SfRangeValues values,
  required bool isInitial,
}) {
  return SingleChildScrollView(
    child: Center(
      child: Column(
        children: [
          // FILTER SECTION
          Column(
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
                        width: (MediaQuery.of(context).size.width * 0.58) - 20,
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
                        child: Showcase(
                          key: _filterByTeamKey,
                          title:
                              AppLocalizations.of(context)!.teamFilterKeyTitle,
                          description:
                              AppLocalizations.of(context)!.teamFilterKeyDesc,
                          shapeBorder: const CircleBorder(),
                          showcaseBackgroundColor: ConstantColors.primary_900,
                          titleTextStyle:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: ConstantColors.neutral_200,
                                    height: 1.5,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.55,
                                  ),
                          descTextStyle:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: ConstantColors.neutral_200,
                                    height: 1.5,
                                  ),
                          overlayPadding: const EdgeInsets.all(8),
                          contentPadding: const EdgeInsets.all(20),
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
                                transferBloc.add(
                                  TransferEvent.setFilter(
                                    filterBy: "team",
                                    filterValue: newTeamName!,
                                  ),
                                );
                              },
                              items: allTeamsNames.map((String teamName) {
                                String finalURL = baseURL;

                                List teamLogoList = allTeams
                                    .where(
                                        (team) => team['teamName'] == teamName)
                                    .toList();

                                if (teamLogoList.isNotEmpty) {
                                  finalURL =
                                      finalURL + teamLogoList[0]['teamLogo'];
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
                    ),

                    // Filter Two (Injury)
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        width: (MediaQuery.of(context).size.width * 0.42) - 20,
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
                        child: Showcase(
                          key: _filterByAvailabiltyKey,
                          title: AppLocalizations.of(context)!
                              .injuryFilterKeyTitle,
                          description:
                              AppLocalizations.of(context)!.injuryFilterKeyDesc,
                          shapeBorder: const CircleBorder(),
                          showcaseBackgroundColor: ConstantColors.primary_900,
                          titleTextStyle:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: ConstantColors.neutral_200,
                                    height: 1.5,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.55,
                                  ),
                          descTextStyle:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: ConstantColors.neutral_200,
                                    height: 1.5,
                                  ),
                          overlayPadding: const EdgeInsets.all(8),
                          contentPadding: const EdgeInsets.all(20),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: state.selectedDropDownInjuryStatusValue,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: ConstantColors.primary_900,
                                  ),
                              onChanged: (String? injuryStatus) {
                                transferBloc.add(
                                  TransferEvent.setFilter(
                                    filterBy: "injury status",
                                    filterValue: injuryStatus!,
                                  ),
                                );
                              },
                              items: <String>[
                                "All",
                                "Available",
                                "Unavailable"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
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
                    Showcase(
                      key: _minPriceLabelKey,
                      title: AppLocalizations.of(context)!.minPriceKeyTitle,
                      description:
                          AppLocalizations.of(context)!.minPriceKeyDesc,
                      shapeBorder: const CircleBorder(),
                      showcaseBackgroundColor: ConstantColors.primary_900,
                      titleTextStyle:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: ConstantColors.neutral_200,
                                height: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.55,
                              ),
                      descTextStyle:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: ConstantColors.neutral_200,
                                height: 1.5,
                              ),
                      overlayPadding: const EdgeInsets.all(8),
                      contentPadding: const EdgeInsets.all(20),
                      child: SizedBox(
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
                            ),
                          ],
                        ),
                      ),
                    ),

                    // SLIDER
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.76,
                      child: Showcase(
                        key: _sliderKey,
                        title: AppLocalizations.of(context)!.sliderKeyTitle,
                        description:
                            AppLocalizations.of(context)!.sliderKeyDesc,
                        shapeBorder: const CircleBorder(),
                        showcaseBackgroundColor: ConstantColors.primary_900,
                        titleTextStyle:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: ConstantColors.neutral_200,
                                  height: 1.5,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.55,
                                ),
                        descTextStyle:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: ConstantColors.neutral_200,
                                  height: 1.5,
                                ),
                        overlayPadding: const EdgeInsets.all(8),
                        contentPadding: const EdgeInsets.all(20),
                        child: SfRangeSlider(
                          min: 3.5,
                          max: 15.0,
                          values: values,
                          interval: 0.1,
                          activeColor: ConstantColors.primary_900,
                          inactiveColor: ConstantColors.primary_400,
                          onChangeEnd: (SfRangeValues value) {
                            transferBloc.add(
                              const TransferEvent.filterByPrice(),
                            );
                          },
                          onChanged: (SfRangeValues value) {
                            transferBloc.add(
                              TransferEvent.setPriceFilter(
                                minValue: value.start,
                                maxValue: value.end,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // MAX LABEL
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Showcase(
                            key: _maxPriceLabelKey,
                            title:
                                AppLocalizations.of(context)!.maxPriceKeyTitle,
                            description:
                                AppLocalizations.of(context)!.maxPriceKeyDesc,
                            shapeBorder: const CircleBorder(),
                            showcaseBackgroundColor: ConstantColors.primary_900,
                            titleTextStyle:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: ConstantColors.neutral_200,
                                      height: 1.5,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.55,
                                    ),
                            descTextStyle:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: ConstantColors.neutral_200,
                                      height: 1.5,
                                    ),
                            overlayPadding: const EdgeInsets.all(8),
                            contentPadding: const EdgeInsets.all(20),
                            child: Text(
                              AppLocalizations.of(context)!.maximumPrice,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 13,
                                  ),
                            ),
                          ),
                          Text(
                            state.maxPriceSet.toStringAsFixed(1),
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
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
                Showcase(
                  key: _playerNameSorterKey,
                  title: AppLocalizations.of(context)!.playerNameSortKeyTitle,
                  description:
                      AppLocalizations.of(context)!.playerNameSortKeyDesc,
                  shapeBorder: const CircleBorder(),
                  showcaseBackgroundColor: ConstantColors.primary_900,
                  titleTextStyle:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ConstantColors.neutral_200,
                            height: 1.5,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.55,
                          ),
                  descTextStyle:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ConstantColors.neutral_200,
                            height: 1.5,
                          ),
                  overlayPadding: const EdgeInsets.all(8),
                  contentPadding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      transferBloc.add(
                        const TransferEvent.setSortFilter(
                          sortBy: 'name',
                        ),
                      );
                    },
                    child: SizedBox(
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.player,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
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
                ),

                // PLAYER PRICE
                Showcase(
                  key: _playerPriceSorterKey,
                  title: AppLocalizations.of(context)!.playerPriceSortKeyTitle,
                  description:
                      AppLocalizations.of(context)!.playerPriceSortKeyDesc,
                  shapeBorder: const CircleBorder(),
                  showcaseBackgroundColor: ConstantColors.primary_900,
                  titleTextStyle:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ConstantColors.neutral_200,
                            height: 1.5,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.55,
                          ),
                  descTextStyle:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ConstantColors.neutral_200,
                            height: 1.5,
                          ),
                  overlayPadding: const EdgeInsets.all(8),
                  contentPadding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      transferBloc.add(
                        const TransferEvent.setSortFilter(
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
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
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
                ),

                // PLAYER POINT
                Showcase(
                  key: _playerPointSorterKey,
                  title: AppLocalizations.of(context)!.playerPointSortKeyTitle,
                  description:
                      AppLocalizations.of(context)!.playerPointSortKeyDesc,
                  shapeBorder: const CircleBorder(),
                  showcaseBackgroundColor: ConstantColors.primary_900,
                  titleTextStyle:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ConstantColors.neutral_200,
                            height: 1.5,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.55,
                          ),
                  descTextStyle:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ConstantColors.neutral_200,
                            height: 1.5,
                          ),
                  overlayPadding: const EdgeInsets.all(8),
                  contentPadding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      transferBloc.add(
                        const TransferEvent.setSortFilter(
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
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
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
                  ),
                )
              ],
            ),
          ),

          // PLAYERS LIST
          Showcase(
            key: _playerCardKey,
            title: AppLocalizations.of(context)!.playerCardKeyTitle,
            description: AppLocalizations.of(context)!.playerCardKeyDesc,
            shapeBorder: const CircleBorder(),
            showcaseBackgroundColor: ConstantColors.primary_900,
            titleTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: ConstantColors.neutral_200,
                  height: 1.5,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.55,
                ),
            descTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: ConstantColors.neutral_200,
                  height: 1.5,
                ),
            overlayPadding: const EdgeInsets.all(8),
            contentPadding: const EdgeInsets.all(20),
            child: ListView.builder(
              key: const Key("transferListViewListViewMain"),
              itemCount: allPositionPlayerFiltered.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                // USER PLAYER CARD
                return UserPlayerCard(
                  currentPlayer: allPositionPlayerFiltered[index],
                  isInitial: isInitial,
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
