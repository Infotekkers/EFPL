import 'package:efpl/domain/fixture/i_fixture_facade.dart';
import 'package:efpl/infrastructure/fixture/api_fixture_repository.dart';
import 'package:efpl/injectable.config.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:efpl/services/socket.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);

  getIt.registerSingleton<IFixtureRepository>(ApiFixtureRepository());
  getIt.registerSingleton<HTTPInstance>(HTTPInstance());
  getIt.registerSingleton<SocketApi>(SocketApi());
}
