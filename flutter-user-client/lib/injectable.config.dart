// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth/auth_bloc.dart' as _i34;
import 'application/auth/register_form/register_form_bloc.dart' as _i24;
import 'application/auth/request_reset_form/request_reset_form_bloc.dart'
    as _i25;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i27;
import 'application/efpl_stats/efpl_stats_bloc.dart' as _i5;
import 'application/epl_stats/epl_stats_bloc.dart' as _i35;
import 'application/fixture/fixture_bloc.dart' as _i7;
import 'application/leagueTable/leaguetable_bloc.dart' as _i16;
import 'application/my_team/myteam_bloc.dart' as _i42;
import 'application/player/player_bloc.dart' as _i43;
import 'application/points/points_bloc.dart' as _i22;
import 'application/settings/bloc/settings_bloc.dart' as _i44;
import 'application/transfer/transfer_bloc.dart' as _i28;
import 'application/util/util_bloc.dart' as _i31;
import 'application/watch_list/watch_list_bloc.dart' as _i32;
import 'domain/auth/i_auth_repository.dart' as _i10;
import 'domain/efpl_stats/i_efpl_stats_facade..dart' as _i6;
import 'domain/epl_stats/i_epl_stats_repository.dart' as _i12;
import 'domain/fixture/i_fixture_facade.dart' as _i8;
import 'domain/league_table/i_league_table_repository.dart' as _i14;
import 'domain/my_team/i_my_team_repository.dart' as _i36;
import 'domain/player/i_player_repository.dart' as _i38;
import 'domain/points/i_points_facade.dart' as _i23;
import 'domain/settings/i_settings_repository.dart' as _i40;
import 'domain/transfer/i_user_players_facade.dart' as _i29;
import 'domain/watch_list/i_watch_list_facade.dart' as _i33;
import 'infrastructure/auth/auth_repository.dart' as _i11;
import 'infrastructure/efpl_stats/efpl_stats_remote_data_provider.dart' as _i3;
import 'infrastructure/epl_stats/epl_stats_remote_data_provider.dart' as _i4;
import 'infrastructure/epl_stats/epl_stats_repository.dart' as _i13;
import 'infrastructure/league_table/league_table_local_data_provider.dart'
    as _i17;
import 'infrastructure/league_table/league_table_remote_data_provider.dart'
    as _i18;
import 'infrastructure/league_table/league_table_repository.dart' as _i15;
import 'infrastructure/my_team/my_team_local_data_provider.dart' as _i19;
import 'infrastructure/my_team/my_team_remote_data_provider.dart' as _i20;
import 'infrastructure/my_team/my_team_repository.dart' as _i37;
import 'infrastructure/player/player_remote_data_provider.dart' as _i21;
import 'infrastructure/player/player_repository.dart' as _i39;
import 'infrastructure/settings/settings_local_data_provider.dart' as _i26;
import 'infrastructure/settings/settings_remote_data_provider.dart' as _i30;
import 'infrastructure/settings/settings_repository.dart' as _i41;
import 'services/http_instance.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.EFPLStatsRemoteDataProvider>(
      () => _i3.EFPLStatsRemoteDataProvider());
  gh.factory<_i4.EPLStatsRemoteDataProvider>(
      () => _i4.EPLStatsRemoteDataProvider());
  gh.lazySingleton<_i5.EfplStatsBloc>(
      () => _i5.EfplStatsBloc(get<_i6.IEFPLStatsRepository>()));
  gh.lazySingleton<_i7.FixtureBloc>(
      () => _i7.FixtureBloc(get<_i8.IFixtureRepository>()));
  gh.factory<_i9.HTTPInstance>(() => _i9.HTTPInstance());
  gh.lazySingleton<_i10.IAuthRepository>(() => _i11.authorize());
  gh.lazySingleton<_i12.IEPLStatsRepository>(
      () => _i13.EPLStatsRepository(get<_i4.EPLStatsRemoteDataProvider>()));
  gh.lazySingleton<_i14.ILeagueTableRepository>(
      () => _i15.APILeagueTableRepository());
  gh.factory<_i16.LeagueTableBloc>(
      () => _i16.LeagueTableBloc(get<_i14.ILeagueTableRepository>()));
  gh.factory<_i17.LeagueTableLocalDataProvider>(
      () => _i17.LeagueTableLocalDataProvider());
  gh.factory<_i18.LeagueTableRemoteDataProvider>(
      () => _i18.LeagueTableRemoteDataProvider());
  gh.factory<_i19.MyTeamLocalDataProvider>(
      () => _i19.MyTeamLocalDataProvider());
  gh.factory<_i20.MyTeamRemoteDataProvider>(
      () => _i20.MyTeamRemoteDataProvider());
  gh.factory<_i21.PlayerRemoteDataProvider>(
      () => _i21.PlayerRemoteDataProvider());
  gh.lazySingleton<_i22.PointsBloc>(
      () => _i22.PointsBloc(get<_i23.IPointInfoRepository>()));
  gh.factory<_i24.RegisterFormBloc>(
      () => _i24.RegisterFormBloc(get<_i10.IAuthRepository>()));
  gh.factory<_i25.RequestResetFormBloc>(
      () => _i25.RequestResetFormBloc(get<_i10.IAuthRepository>()));
  gh.factory<_i26.SettingsLocalDataProvider>(
      () => _i26.SettingsLocalDataProvider());
  gh.factory<_i27.SignInFormBloc>(
      () => _i27.SignInFormBloc(get<_i10.IAuthRepository>()));
  gh.lazySingleton<_i28.TransferBloc>(
      () => _i28.TransferBloc(get<_i29.ITransferRepository>()));
  gh.factory<_i30.UserDetailRemoteDataProvider>(
      () => _i30.UserDetailRemoteDataProvider());
  gh.lazySingleton<_i31.UtilBloc>(() => _i31.UtilBloc());
  gh.lazySingleton<_i32.WatchListBloc>(
      () => _i32.WatchListBloc(get<_i33.IWatchListRepository>()));
  gh.lazySingleton<_i34.AuthBloc>(
      () => _i34.AuthBloc(get<_i10.IAuthRepository>()));
  gh.lazySingleton<_i35.EPLStatsBloc>(
      () => _i35.EPLStatsBloc(get<_i12.IEPLStatsRepository>()));
  gh.lazySingleton<_i36.IMyTeamRepository>(() => _i37.MyTeamRepository(
      get<_i19.MyTeamLocalDataProvider>(),
      get<_i20.MyTeamRemoteDataProvider>()));
  gh.lazySingleton<_i38.IPlayerRepository>(
      () => _i39.PlayerRepository(get<_i21.PlayerRemoteDataProvider>()));
  gh.lazySingleton<_i40.ISettingsRepository>(() => _i41.SettingsRepository(
      get<_i26.SettingsLocalDataProvider>(),
      get<_i30.UserDetailRemoteDataProvider>()));
  gh.lazySingleton<_i42.MyTeamBloc>(
      () => _i42.MyTeamBloc(get<_i36.IMyTeamRepository>()));
  gh.factory<_i43.PlayerBloc>(
      () => _i43.PlayerBloc(get<_i38.IPlayerRepository>()));
  gh.lazySingleton<_i44.SettingsBloc>(
      () => _i44.SettingsBloc(get<_i40.ISettingsRepository>()));
  return get;
}
