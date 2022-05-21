// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/my_team/myteam_bloc.dart' as _i12;
import 'application/player/player_bloc.dart' as _i8;
import 'application/util/util_bloc.dart' as _i9;
import 'domain/my_team/i_my_team_repository.dart' as _i10;
import 'domain/player/i_player_repository.dart' as _i3;
import 'infrastructure/my_team/my_team_local_data_provider.dart' as _i6;
import 'infrastructure/my_team/my_team_remote_data_provider.dart' as _i7;
import 'infrastructure/my_team/my_team_repository.dart' as _i11;
import 'infrastructure/player/player_remote_data_provider.dart' as _i5;
import 'infrastructure/player/player_repository.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IPlayerRepository>(
      () => _i4.PlayerRepository(get<_i5.PlayerRemoteDataProvider>()));
  gh.factory<_i6.MyTeamLocalDataProvider>(() => _i6.MyTeamLocalDataProvider());
  gh.factory<_i7.MyTeamRemoteDataProvider>(
      () => _i7.MyTeamRemoteDataProvider());
  gh.factory<_i8.PlayerBloc>(
      () => _i8.PlayerBloc(get<_i3.IPlayerRepository>()));
  gh.lazySingleton<_i9.UtilBloc>(() => _i9.UtilBloc());
  gh.lazySingleton<_i10.IMyTeamRepository>(() => _i11.MyTeamRepository(
      get<_i6.MyTeamLocalDataProvider>(), get<_i7.MyTeamRemoteDataProvider>()));
  gh.factory<_i12.MyTeamBloc>(
      () => _i12.MyTeamBloc(get<_i10.IMyTeamRepository>()));
  return get;
}
