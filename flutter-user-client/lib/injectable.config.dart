// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/my_team/myteam_bloc.dart' as _i10;
import 'application/util/util_bloc.dart' as _i11;
import 'domain/my_team/i_my_team_repository.dart' as _i3;
import 'domain/player/i_player_repository.dart' as _i7;
import 'infrastructure/my_team/my_team_local_data_provider.dart' as _i5;
import 'infrastructure/my_team/my_team_remote_data_provider.dart' as _i6;
import 'infrastructure/my_team/my_team_repository.dart' as _i4;
import 'infrastructure/player/player_remote_data_provider.dart' as _i9;
import 'infrastructure/player/player_repository.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IMyTeamRepository>(() => _i4.MyTeamRepository(
      get<_i5.MyTeamLocalDataProvider>(), get<_i6.MyTeamRemoteDataProvider>()));
  gh.lazySingleton<_i7.IPlayerRepository>(
      () => _i8.PlayerRepository(get<_i9.PlayerRemoteDataProvider>()));
  gh.factory<_i10.MyTeamBloc>(
      () => _i10.MyTeamBloc(get<_i3.IMyTeamRepository>()));
  gh.factory<_i11.UtilBloc>(() => _i11.UtilBloc());
  return get;
}
