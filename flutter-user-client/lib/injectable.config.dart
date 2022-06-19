// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth/auth_bloc.dart' as _i36;
import 'application/auth/register_form/register_form_bloc.dart' as _i28;
import 'application/auth/request_reset_form/request_reset_form_bloc.dart'
    as _i29;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i30;
import 'application/custom_leagues/create_custom_league_form/create_custom_league_form_bloc.dart'
    as _i3;
import 'application/custom_leagues/custom_leagues_bloc.dart' as _i5;
import 'application/custom_leagues/join_custom_league_form/join_custom_league_form_bloc.dart'
    as _i19;
import 'application/efpl_stats/efpl_stats_bloc.dart' as _i8;
import 'application/epl_stats/epl_stats_bloc.dart' as _i37;
import 'application/fixture/fixture_bloc.dart' as _i10;
import 'application/leagueTable/leaguetable_bloc.dart' as _i20;
import 'application/my_team/myteam_bloc.dart' as _i42;
import 'application/player/player_bloc.dart' as _i43;
import 'application/points/points_bloc.dart' as _i26;
import 'application/transfer/transfer_bloc.dart' as _i31;
import 'application/util/util_bloc.dart' as _i33;
import 'application/watch_list/watch_list_bloc.dart' as _i34;
import 'domain/auth/i_auth_repository.dart' as _i13;
import 'domain/custom_leagues/i_custom_leagues_repository.dart' as _i4;
import 'domain/efpl_stats/i_efpl_stats_facade..dart' as _i9;
import 'domain/epl_stats/i_epl_stats_repository.dart' as _i15;
import 'domain/fixture/i_fixture_facade.dart' as _i11;
import 'domain/league_table/i_league_table_repository.dart' as _i17;
import 'domain/my_team/i_my_team_repository.dart' as _i38;
import 'domain/player/i_player_repository.dart' as _i40;
import 'domain/points/i_points_facade.dart' as _i27;
import 'domain/transfer/i_user_players_facade.dart' as _i32;
import 'domain/watch_list/i_watch_list_facade.dart' as _i35;
import 'infrastructure/auth/auth_repository.dart' as _i14;
import 'infrastructure/efpl_stats/efpl_stats_remote_data_provider.dart' as _i6;
import 'infrastructure/epl_stats/epl_stats_remote_data_provider.dart' as _i7;
import 'infrastructure/epl_stats/epl_stats_repository.dart' as _i16;
import 'infrastructure/league_table/league_table_local_data_provider.dart'
    as _i21;
import 'infrastructure/league_table/league_table_remote_data_provider.dart'
    as _i22;
import 'infrastructure/league_table/league_table_repository.dart' as _i18;
import 'infrastructure/my_team/my_team_local_data_provider.dart' as _i23;
import 'infrastructure/my_team/my_team_remote_data_provider.dart' as _i24;
import 'infrastructure/my_team/my_team_repository.dart' as _i39;
import 'infrastructure/player/player_remote_data_provider.dart' as _i25;
import 'infrastructure/player/player_repository.dart' as _i41;
import 'services/http_instance.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CreateCustomLeagueFormBloc>(() =>
      _i3.CreateCustomLeagueFormBloc(get<_i4.ICustomLeaguesRepository>()));
  gh.lazySingleton<_i5.CustomLeaguesBloc>(
      () => _i5.CustomLeaguesBloc(get<_i4.ICustomLeaguesRepository>()));
  gh.factory<_i6.EFPLStatsRemoteDataProvider>(
      () => _i6.EFPLStatsRemoteDataProvider());
  gh.factory<_i7.EPLStatsRemoteDataProvider>(
      () => _i7.EPLStatsRemoteDataProvider());
  gh.lazySingleton<_i8.EfplStatsBloc>(
      () => _i8.EfplStatsBloc(get<_i9.IEFPLStatsRepository>()));
  gh.lazySingleton<_i10.FixtureBloc>(
      () => _i10.FixtureBloc(get<_i11.IFixtureRepository>()));
  gh.factory<_i12.HTTPInstance>(() => _i12.HTTPInstance());
  gh.lazySingleton<_i13.IAuthRepository>(() => _i14.authorize());
  gh.lazySingleton<_i15.IEPLStatsRepository>(
      () => _i16.EPLStatsRepository(get<_i7.EPLStatsRemoteDataProvider>()));
  gh.lazySingleton<_i17.ILeagueTableRepository>(
      () => _i18.APILeagueTableRepository());
  gh.factory<_i19.JoinCustomLeagueFormBloc>(
      () => _i19.JoinCustomLeagueFormBloc(get<_i4.ICustomLeaguesRepository>()));
  gh.factory<_i20.LeagueTableBloc>(
      () => _i20.LeagueTableBloc(get<_i17.ILeagueTableRepository>()));
  gh.factory<_i21.LeagueTableLocalDataProvider>(
      () => _i21.LeagueTableLocalDataProvider());
  gh.factory<_i22.LeagueTableRemoteDataProvider>(
      () => _i22.LeagueTableRemoteDataProvider());
  gh.factory<_i23.MyTeamLocalDataProvider>(
      () => _i23.MyTeamLocalDataProvider());
  gh.factory<_i24.MyTeamRemoteDataProvider>(
      () => _i24.MyTeamRemoteDataProvider());
  gh.factory<_i25.PlayerRemoteDataProvider>(
      () => _i25.PlayerRemoteDataProvider());
  gh.lazySingleton<_i26.PointsBloc>(
      () => _i26.PointsBloc(get<_i27.IPointInfoRepository>()));
  gh.factory<_i28.RegisterFormBloc>(
      () => _i28.RegisterFormBloc(get<_i13.IAuthRepository>()));
  gh.factory<_i29.RequestResetFormBloc>(
      () => _i29.RequestResetFormBloc(get<_i13.IAuthRepository>()));
  gh.factory<_i30.SignInFormBloc>(
      () => _i30.SignInFormBloc(get<_i13.IAuthRepository>()));
  gh.lazySingleton<_i31.TransferBloc>(
      () => _i31.TransferBloc(get<_i32.ITransferRepository>()));
  gh.lazySingleton<_i33.UtilBloc>(() => _i33.UtilBloc());
  gh.lazySingleton<_i34.WatchListBloc>(
      () => _i34.WatchListBloc(get<_i35.IWatchListRepository>()));
  gh.lazySingleton<_i36.AuthBloc>(
      () => _i36.AuthBloc(get<_i13.IAuthRepository>()));
  gh.lazySingleton<_i37.EPLStatsBloc>(
      () => _i37.EPLStatsBloc(get<_i15.IEPLStatsRepository>()));
  gh.lazySingleton<_i38.IMyTeamRepository>(() => _i39.MyTeamRepository(
      get<_i23.MyTeamLocalDataProvider>(),
      get<_i24.MyTeamRemoteDataProvider>()));
  gh.lazySingleton<_i40.IPlayerRepository>(
      () => _i41.PlayerRepository(get<_i25.PlayerRemoteDataProvider>()));
  gh.lazySingleton<_i42.MyTeamBloc>(
      () => _i42.MyTeamBloc(get<_i38.IMyTeamRepository>()));
  gh.factory<_i43.PlayerBloc>(
      () => _i43.PlayerBloc(get<_i40.IPlayerRepository>()));
  return get;
}
