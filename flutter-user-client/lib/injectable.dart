import 'package:efpl/domain/custom_leagues/i_custom_leagues_repository.dart';
import 'package:efpl/infrastructure/custom_leagues/custom_leagues_repository.dart';
import 'package:efpl/injectable.config.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);

  getIt.registerSingleton<HTTPInstance>(HTTPInstance());
  getIt.registerSingleton<ICustomLeaguesRepository>(
      ApiCustomLeaguesRepository());
}
