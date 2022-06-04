// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth/auth_bloc.dart' as _i24;
import 'application/auth/register_form/register_form_bloc.dart' as _i16;
import 'application/auth/request_reset_form/request_reset_form_bloc.dart'
    as _i17;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i18;
import 'application/epl_stats/epl_stats_bloc.dart' as _i25;
import 'application/fixture/fixture_bloc.dart' as _i4;
import 'application/my_team/myteam_bloc.dart' as _i30;
import 'application/player/player_bloc.dart' as _i31;
import 'application/points/points_bloc.dart' as _i14;
import 'application/transfer/transfer_bloc.dart' as _i19;
import 'application/util/util_bloc.dart' as _i21;
import 'application/watch_list/watch_list_bloc.dart' as _i22;
import 'domain/auth/i_auth_repository.dart' as _i7;
import 'domain/epl_stats/i_epl_stats_repository.dart' as _i9;
import 'domain/fixture/i_fixture_facade.dart' as _i5;
import 'domain/my_team/i_my_team_repository.dart' as _i26;
import 'domain/player/i_player_repository.dart' as _i28;
import 'domain/points/i_points_facade.dart' as _i15;
import 'domain/transfer/i_user_players_facade.dart' as _i20;
import 'domain/watch_list/i_watch_list_facade.dart' as _i23;
import 'infrastructure/auth/auth_repository.dart' as _i8;
import 'infrastructure/epl_stats/epl_stats_remote_data_provider.dart' as _i3;
import 'infrastructure/epl_stats/epl_stats_repository.dart' as _i10;
import 'infrastructure/my_team/my_team_local_data_provider.dart' as _i11;
import 'infrastructure/my_team/my_team_remote_data_provider.dart' as _i12;
import 'infrastructure/my_team/my_team_repository.dart' as _i27;
import 'infrastructure/player/player_remote_data_provider.dart' as _i13;
import 'infrastructure/player/player_repository.dart' as _i29;
import 'services/http_instance.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.EPLStatsRemoteDataProvider>(
      () => _i3.EPLStatsRemoteDataProvider());
  gh.lazySingleton<_i4.FixtureBloc>(
      () => _i4.FixtureBloc(get<_i5.IFixtureRepository>()));
  gh.factory<_i6.HTTPInstance>(() => _i6.HTTPInstance());
  gh.lazySingleton<_i7.IAuthRepository>(() => _i8.AuthRepository());
  gh.lazySingleton<_i9.IEPLStatsRepository>(
      () => _i10.EPLStatsRepository(get<_i3.EPLStatsRemoteDataProvider>()));
  gh.factory<_i11.MyTeamLocalDataProvider>(
      () => _i11.MyTeamLocalDataProvider());
  gh.factory<_i12.MyTeamRemoteDataProvider>(
      () => _i12.MyTeamRemoteDataProvider());
  gh.factory<_i13.PlayerRemoteDataProvider>(
      () => _i13.PlayerRemoteDataProvider());
  gh.lazySingleton<_i14.PointsBloc>(
      () => _i14.PointsBloc(get<_i15.IPointInfoRepository>()));
  gh.factory<_i16.RegisterFormBloc>(
      () => _i16.RegisterFormBloc(get<_i7.IAuthRepository>()));
  gh.factory<_i17.RequestResetFormBloc>(
      () => _i17.RequestResetFormBloc(get<_i7.IAuthRepository>()));
  gh.factory<_i18.SignInFormBloc>(
      () => _i18.SignInFormBloc(get<_i7.IAuthRepository>()));
  gh.lazySingleton<_i19.TransferBloc>(
      () => _i19.TransferBloc(get<_i20.ITransferRepository>()));
  gh.lazySingleton<_i21.UtilBloc>(() => _i21.UtilBloc());
  gh.lazySingleton<_i22.WatchListBloc>(
      () => _i22.WatchListBloc(get<_i23.IWatchListRepository>()));
  gh.factory<_i24.AuthBloc>(() => _i24.AuthBloc(get<_i7.IAuthRepository>()));
  gh.lazySingleton<_i25.EPLStatsBloc>(
      () => _i25.EPLStatsBloc(get<_i9.IEPLStatsRepository>()));
  gh.lazySingleton<_i26.IMyTeamRepository>(() => _i27.MyTeamRepository(
      get<_i11.MyTeamLocalDataProvider>(),
      get<_i12.MyTeamRemoteDataProvider>()));
  gh.lazySingleton<_i28.IPlayerRepository>(
      () => _i29.PlayerRepository(get<_i13.PlayerRemoteDataProvider>()));
  gh.lazySingleton<_i30.MyTeamBloc>(
      () => _i30.MyTeamBloc(get<_i26.IMyTeamRepository>()));
  gh.factory<_i31.PlayerBloc>(
      () => _i31.PlayerBloc(get<_i28.IPlayerRepository>()));
  return get;
}
