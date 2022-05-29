// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth/auth_bloc.dart' as _i27;
import 'application/auth/register_form/register_form_bloc.dart' as _i21;
import 'application/auth/request_reset_form/request_reset_form_bloc.dart'
    as _i22;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i23;
import 'application/epl_stats/epl_stats_bloc.dart' as _i28;
import 'application/fixture/fixture_bloc.dart' as _i4;
import 'application/leagueTable/leaguetable_bloc.dart' as _i13;
import 'application/my_team/myteam_bloc.dart' as _i33;
import 'application/player/player_bloc.dart' as _i34;
import 'application/points/points_bloc.dart' as _i19;
import 'application/transfer/transfer_bloc.dart' as _i24;
import 'application/util/util_bloc.dart' as _i26;
import 'domain/auth/i_auth_repository.dart' as _i7;
import 'domain/epl_stats/i_epl_stats_repository.dart' as _i9;
import 'domain/fixture/i_fixture_facade.dart' as _i5;
import 'domain/league_table/i_league_table_repository.dart' as _i11;
import 'domain/my_team/i_my_team_repository.dart' as _i29;
import 'domain/player/i_player_repository.dart' as _i31;
import 'domain/points/i_points_facade.dart' as _i20;
import 'domain/transfer/i_user_players_facade.dart' as _i25;
import 'infrastructure/auth/auth_repository.dart' as _i8;
import 'infrastructure/epl_stats/epl_stats_remote_data_provider.dart' as _i3;
import 'infrastructure/epl_stats/epl_stats_repository.dart' as _i10;
import 'infrastructure/league_table/league_table_local_data_provider.dart'
    as _i14;
import 'infrastructure/league_table/league_table_remote_data_provider.dart'
    as _i15;
import 'infrastructure/league_table/league_table_repository.dart' as _i12;
import 'infrastructure/my_team/my_team_local_data_provider.dart' as _i16;
import 'infrastructure/my_team/my_team_remote_data_provider.dart' as _i17;
import 'infrastructure/my_team/my_team_repository.dart' as _i30;
import 'infrastructure/player/player_remote_data_provider.dart' as _i18;
import 'infrastructure/player/player_repository.dart' as _i32;
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
  gh.lazySingleton<_i11.ILeagueTableRepository>(
      () => _i12.APILeagueTableRepository());
  gh.factory<_i13.LeagueTableBloc>(
      () => _i13.LeagueTableBloc(get<_i11.ILeagueTableRepository>()));
  gh.factory<_i14.LeagueTableLocalDataProvider>(
      () => _i14.LeagueTableLocalDataProvider());
  gh.factory<_i15.LeagueTableRemoteDataProvider>(
      () => _i15.LeagueTableRemoteDataProvider());
  gh.factory<_i16.MyTeamLocalDataProvider>(
      () => _i16.MyTeamLocalDataProvider());
  gh.factory<_i17.MyTeamRemoteDataProvider>(
      () => _i17.MyTeamRemoteDataProvider());
  gh.factory<_i18.PlayerRemoteDataProvider>(
      () => _i18.PlayerRemoteDataProvider());
  gh.lazySingleton<_i19.PointsBloc>(
      () => _i19.PointsBloc(get<_i20.IPointInfoRepository>()));
  gh.factory<_i21.RegisterFormBloc>(
      () => _i21.RegisterFormBloc(get<_i7.IAuthRepository>()));
  gh.factory<_i22.RequestResetFormBloc>(
      () => _i22.RequestResetFormBloc(get<_i7.IAuthRepository>()));
  gh.factory<_i23.SignInFormBloc>(
      () => _i23.SignInFormBloc(get<_i7.IAuthRepository>()));
  gh.lazySingleton<_i24.TransferBloc>(
      () => _i24.TransferBloc(get<_i25.ITransferRepository>()));
  gh.lazySingleton<_i26.UtilBloc>(() => _i26.UtilBloc());
  gh.factory<_i27.AuthBloc>(() => _i27.AuthBloc(get<_i7.IAuthRepository>()));
  gh.lazySingleton<_i28.EPLStatsBloc>(
      () => _i28.EPLStatsBloc(get<_i9.IEPLStatsRepository>()));
  gh.lazySingleton<_i29.IMyTeamRepository>(() => _i30.MyTeamRepository(
      get<_i16.MyTeamLocalDataProvider>(),
      get<_i17.MyTeamRemoteDataProvider>()));
  gh.lazySingleton<_i31.IPlayerRepository>(
      () => _i32.PlayerRepository(get<_i18.PlayerRemoteDataProvider>()));
  gh.lazySingleton<_i33.MyTeamBloc>(
      () => _i33.MyTeamBloc(get<_i29.IMyTeamRepository>()));
  gh.factory<_i34.PlayerBloc>(
      () => _i34.PlayerBloc(get<_i31.IPlayerRepository>()));
  return get;
}
