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
  return get;
}
