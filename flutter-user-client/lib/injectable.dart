import 'package:efpl/infrastructure/league_table/league_table_repository.dart';
import 'package:efpl/injectable.config.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:efpl/domain/league_table/i_league_table_repository.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);

  getIt.registerSingleton<ILeagueTableRepository>(APILeagueTableRepository());
  getIt.registerSingleton<HTTPInstance>(HTTPInstance());
}
