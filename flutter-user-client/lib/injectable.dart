// ignore_for_file: unused_import

import 'package:efpl/domain/auth/i_auth_repository.dart';
import 'package:efpl/domain/efpl_stats/i_efpl_stats_facade..dart';
import 'package:efpl/infrastructure/league_table/league_table_repository.dart';
import 'package:efpl/domain/fixture/i_fixture_facade.dart';
import 'package:efpl/domain/points/i_points_facade.dart';
import 'package:efpl/domain/transfer/i_user_players_facade.dart';
import 'package:efpl/infrastructure/efpl_stats/efpl_stats_repository.dart';
import 'package:efpl/domain/watch_list/i_watch_list_facade.dart';
import 'package:efpl/infrastructure/points/points_repository.dart';
import 'package:efpl/infrastructure/transfer/transfer_repository.dart';
import 'package:efpl/infrastructure/watch_list/watch_list_repository.dart';

import 'package:efpl/injectable.config.dart';
import 'package:efpl/services/socket.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
// import 'package:efpl/domain/league_table/i_league_table_repository.dart';

import 'infrastructure/auth/auth_repository.dart';
import 'infrastructure/fixture/fixture_repository.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);

  // getIt.registerSingleton<ILeagueTableRepository>(APILeagueTableRepository());
  // getIt.registerSingleton<HTTPInstance>(HTTPInstance());
  // Facades
  getIt.registerSingleton<IFixtureRepository>(ApiFixtureRepository());
  getIt.registerSingleton<ITransferRepository>(ApiTransferRepository());
  getIt.registerSingleton<IPointInfoRepository>(ApiPointsInfoRepository());
  getIt.registerSingleton<IEFPLStatsRepository>(EFPLStatsRepository());
  getIt.registerSingleton<IWatchListRepository>(ApiWatchListRepository());

  // getIt.registerSingleton<HTTPInstance>(HTTPInstance());
  getIt.registerSingleton<SocketApi>(SocketApi());
}
