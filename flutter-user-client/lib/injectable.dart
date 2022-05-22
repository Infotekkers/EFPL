import 'package:efpl/domain/fixture/i_fixture_facade.dart';

import 'package:efpl/injectable.config.dart';
import 'package:efpl/services/socket.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'infrastructure/fixture/fixture_repository.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);

  // Facades
  getIt.registerSingleton<IFixtureRepository>(ApiFixtureRepository());

  // getIt.registerSingleton<HTTPInstance>(HTTPInstance());
  getIt.registerSingleton<SocketApi>(SocketApi());
}
