// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/leagueTable/leaguetable_bloc.dart' as _i3;
import 'application/util/util_bloc.dart' as _i5;
import 'domain/league_table/i_league_table_repository.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.LeagueTableBloc>(
      () => _i3.LeagueTableBloc(get<_i4.ILeagueTableRepository>()));
  gh.factory<_i5.UtilBloc>(() => _i5.UtilBloc());
  return get;
}
