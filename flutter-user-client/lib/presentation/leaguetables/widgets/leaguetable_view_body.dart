import 'package:cached_network_image/cached_network_image.dart';
import 'package:efpl/application/leagueTable/leaguetable_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/core/widgets/bouncing_ball_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../colors.dart';

final String _baseUrl = "${dotenv.env["API"]}";

class LeagueTableViewBody extends StatelessWidget {
  const LeagueTableViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeagueTableBloc, LeagueTableState>(
      listener: (_, __) => {},
      builder: (context, state) => state.map(
        initial: (_) => const Text("Initial"),
        loadFailure: (_) => Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.epl +
                  " " +
                  AppLocalizations.of(context)!.standings,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: ConstantColors.primary_900,
                  ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.blue[50],
            ),
            backgroundColor: Colors.blue[50],
            foregroundColor: ConstantColors.primary_900,
            elevation: 0,
          ),
          body: const Center(
            child: Text("Something Went Wrong"),
          ),
        ),
        loadInProgress: (_) => const BouncingBallLoadingIndicator(),
        loadSuccess: (state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.epl +
                    " " +
                    AppLocalizations.of(context)!.standings,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: ConstantColors.primary_900,
                    ),
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.blue[50],
              ),
              backgroundColor: Colors.blue[50],
              foregroundColor: ConstantColors.primary_900,
              elevation: 0,
            ),
            body: Column(children: [
              const TableHeader(),
              Expanded(
                child: ListView.builder(
                  itemCount: state.leagueTable.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(4, 2, 0, 2),
                      height: 50,
                      decoration: BoxDecoration(
                        color: index % 2 != 0 ? Colors.blue[50] : Colors.white,
                        border: Border(
                          bottom:
                              BorderSide(width: 1, color: Colors.grey.shade300),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  width: 4,
                                  color: index == 0
                                      ? Colors.green
                                      : index > 12
                                          ? Colors.red
                                          : index % 2 != 0
                                              ? Colors.blue[50]
                                              : Colors.white,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Flexible(
                                  child: CachedNetworkImage(
                                    width: 30,
                                    height: 30,
                                    imageUrl:
                                        "$_baseUrl${state.leagueTable[index].teamLogo.getOrCrash()}",
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  getIt<UtilBloc>().state.locale.languageCode ==
                                          "am"
                                      ? (state.leagueTable[index].teamNameAmh
                                                      .getOrCrash()
                                                      .split(" "))
                                                  .length >
                                              1
                                          ? state.leagueTable[index].teamNameAmh
                                                  .getOrCrash()
                                                  .split(" ")[0][0] +
                                              state.leagueTable[index]
                                                  .teamNameAmh
                                                  .getOrCrash()
                                                  .split(" ")[1][0]
                                          : state.leagueTable[index].teamNameAmh
                                                  .getOrCrash()
                                                  .split(" ")[0][0] +
                                              state.leagueTable[index]
                                                  .teamNameAmh
                                                  .getOrCrash()
                                                  .split(" ")[0][1]
                                      : "${state.leagueTable[index].teamName.getOrCrash().split(" ")[0][0]}${state.leagueTable[index].teamName.getOrCrash().split(" ")[1][0]}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              state.leagueTable[index].teamPoint
                                  .getOrCrash()
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${state.leagueTable[index].won.getOrCrash()}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${state.leagueTable[index].Draw.getOrCrash()}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${state.leagueTable[index].lost.getOrCrash()}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${state.leagueTable[index].goalDifferential.getOrCrash()}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${state.leagueTable[index].teamPoint.getOrCrash()}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}

class TableHeader extends StatelessWidget {
  const TableHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyText2!.copyWith(
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: ConstantColors.primary_900,
        );
    return Container(
      height: 30,
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.pos,
              style: style,
            ),
          ),
          Expanded(
              flex: 2,
              child: Text(
                AppLocalizations.of(context)!.club,
                style: style,
              )),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.p,
              style: style,
            ),
          ),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.w,
              style: style,
            ),
          ),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.d,
              style: style,
            ),
          ),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.l,
              style: style,
            ),
          ),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.gd,
              style: style,
            ),
          ),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.pts,
              style: style,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.blue[50],
      ),
    );
  }
}
