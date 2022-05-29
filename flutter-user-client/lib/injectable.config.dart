// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/fixture/fixture_bloc.dart' as _i3;
import 'application/leagueTable/leaguetable_bloc.dart' as _i8;
import 'application/my_team/myteam_bloc.dart' as _i23;
import 'application/player/player_bloc.dart' as _i24;
import 'application/points/points_bloc.dart' as _i14;
import 'application/transfer/transfer_bloc.dart' as _i16;
import 'application/util/util_bloc.dart' as _i18;
import 'domain/fixture/i_fixture_facade.dart' as _i4;
import 'domain/league_table/i_league_table_repository.dart' as _i6;
import 'domain/my_team/i_my_team_repository.dart' as _i19;
import 'domain/player/i_player_repository.dart' as _i21;
import 'domain/points/i_points_facade.dart' as _i15;
import 'domain/transfer/i_user_players_facade.dart' as _i17;
import 'infrastructure/league_table/league_table_local_data_provider.dart'
    as _i9;
import 'infrastructure/league_table/league_table_remote_data_provider.dart'
    as _i10;
import 'infrastructure/league_table/league_table_repository.dart' as _i7;
import 'infrastructure/my_team/my_team_local_data_provider.dart' as _i11;
import 'infrastructure/my_team/my_team_remote_data_provider.dart' as _i12;
import 'infrastructure/my_team/my_team_repository.dart' as _i20;
import 'infrastructure/player/player_remote_data_provider.dart' as _i13;
import 'infrastructure/player/player_repository.dart' as _i22;
import 'services/http_instance.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.FixtureBloc>(
      () => _i3.FixtureBloc(get<_i4.IFixtureRepository>()));
  gh.factory<_i5.HTTPInstance>(() => _i5.HTTPInstance());
  gh.lazySingleton<_i6.ILeagueTableRepository>(
      () => _i7.APILeagueTableRepository());
  gh.factory<_i8.LeagueTableBloc>(
      () => _i8.LeagueTableBloc(get<_i6.ILeagueTableRepository>()));
  gh.factory<_i9.LeagueTableLocalDataProvider>(
      () => _i9.LeagueTableLocalDataProvider());
  gh.factory<_i10.LeagueTableRemoteDataProvider>(
      () => _i10.LeagueTableRemoteDataProvider());
  gh.factory<_i11.MyTeamLocalDataProvider>(
      () => _i11.MyTeamLocalDataProvider());
  gh.factory<_i12.MyTeamRemoteDataProvider>(
      () => _i12.MyTeamRemoteDataProvider());
  gh.factory<_i13.PlayerRemoteDataProvider>(
      () => _i13.PlayerRemoteDataProvider());
  gh.lazySingleton<_i14.PointsBloc>(
      () => _i14.PointsBloc(get<_i15.IPointInfoRepository>()));
  gh.lazySingleton<_i16.TransferBloc>(
      () => _i16.TransferBloc(get<_i17.ITransferRepository>()));
  gh.lazySingleton<_i18.UtilBloc>(() => _i18.UtilBloc());
  gh.lazySingleton<_i19.IMyTeamRepository>(() => _i20.MyTeamRepository(
      get<_i11.MyTeamLocalDataProvider>(),
      get<_i12.MyTeamRemoteDataProvider>()));
  gh.lazySingleton<_i21.IPlayerRepository>(
      () => _i22.PlayerRepository(get<_i13.PlayerRemoteDataProvider>()));
  gh.lazySingleton<_i23.MyTeamBloc>(
      () => _i23.MyTeamBloc(get<_i19.IMyTeamRepository>()));
  gh.factory<_i24.PlayerBloc>(
      () => _i24.PlayerBloc(get<_i21.IPlayerRepository>()));
  return get;
}
