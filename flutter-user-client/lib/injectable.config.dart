// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/leagueTable/leaguetable_bloc.dart' as _i5;
import 'application/util/util_bloc.dart' as _i8;
import 'domain/league_table/i_league_table_repository.dart' as _i3;
import 'infrastructure/league_table/league_table_local_data_provider.dart'
    as _i6;
import 'infrastructure/league_table/league_table_remote_data_provider.dart'
    as _i7;
import 'infrastructure/league_table/league_table_repository.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas
import 'application/fixture/fixture_bloc.dart' as _i3;
import 'application/my_team/myteam_bloc.dart' as _i18;
import 'application/player/player_bloc.dart' as _i19;
import 'application/points/points_bloc.dart' as _i9;
import 'application/transfer/transfer_bloc.dart' as _i11;
import 'application/util/util_bloc.dart' as _i13;
import 'domain/fixture/i_fixture_facade.dart' as _i4;
import 'domain/my_team/i_my_team_repository.dart' as _i14;
import 'domain/player/i_player_repository.dart' as _i16;
import 'domain/points/i_points_facade.dart' as _i10;
import 'domain/transfer/i_user_players_facade.dart' as _i12;
import 'infrastructure/my_team/my_team_local_data_provider.dart' as _i6;
import 'infrastructure/my_team/my_team_remote_data_provider.dart' as _i7;
import 'infrastructure/my_team/my_team_repository.dart' as _i15;
import 'infrastructure/player/player_remote_data_provider.dart' as _i8;
import 'infrastructure/player/player_repository.dart' as _i17;
import 'services/http_instance.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ILeagueTableRepository>(
      () => _i4.APILeagueTableRepository());
  gh.factory<_i5.LeagueTableBloc>(
      () => _i5.LeagueTableBloc(get<_i3.ILeagueTableRepository>()));
  gh.factory<_i6.LeagueTableLocalDataProvider>(
      () => _i6.LeagueTableLocalDataProvider());
  gh.factory<_i7.LeagueTableRemoteDataProvider>(
      () => _i7.LeagueTableRemoteDataProvider());
  gh.factory<_i8.UtilBloc>(() => _i8.UtilBloc());
  gh.lazySingleton<_i3.FixtureBloc>(
      () => _i3.FixtureBloc(get<_i4.IFixtureRepository>()));
  gh.factory<_i5.HTTPInstance>(() => _i5.HTTPInstance());
  gh.factory<_i6.MyTeamLocalDataProvider>(() => _i6.MyTeamLocalDataProvider());
  gh.factory<_i7.MyTeamRemoteDataProvider>(
      () => _i7.MyTeamRemoteDataProvider());
  gh.factory<_i8.PlayerRemoteDataProvider>(
      () => _i8.PlayerRemoteDataProvider());
  gh.lazySingleton<_i9.PointsBloc>(
      () => _i9.PointsBloc(get<_i10.IPointInfoRepository>()));
  gh.lazySingleton<_i11.TransferBloc>(
      () => _i11.TransferBloc(get<_i12.ITransferRepository>()));
  gh.lazySingleton<_i13.UtilBloc>(() => _i13.UtilBloc());
  gh.lazySingleton<_i14.IMyTeamRepository>(() => _i15.MyTeamRepository(
      get<_i6.MyTeamLocalDataProvider>(), get<_i7.MyTeamRemoteDataProvider>()));
  gh.lazySingleton<_i16.IPlayerRepository>(
      () => _i17.PlayerRepository(get<_i8.PlayerRemoteDataProvider>()));
  gh.lazySingleton<_i18.MyTeamBloc>(
      () => _i18.MyTeamBloc(get<_i14.IMyTeamRepository>()));
  gh.factory<_i19.PlayerBloc>(
      () => _i19.PlayerBloc(get<_i16.IPlayerRepository>()));
  return get;
}
