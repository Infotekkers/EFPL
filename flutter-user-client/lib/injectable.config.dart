// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/custom_leagues/create_custom_league_form/create_custom_league_form_bloc.dart'
    as _i3;
import 'application/custom_leagues/custom_leagues_bloc.dart' as _i5;
import 'application/custom_leagues/join_custom_league_form/join_custom_league_form_bloc.dart'
    as _i6;
import 'application/util/util_bloc.dart' as _i7;
import 'domain/custom_leagues/i_custom_leagues_repository.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CreateCustomLeagueFormBloc>(() =>
      _i3.CreateCustomLeagueFormBloc(get<_i4.ICustomLeaguesRepository>()));
  gh.lazySingleton<_i5.CustomLeaguesBloc>(
      () => _i5.CustomLeaguesBloc(get<_i4.ICustomLeaguesRepository>()));
  gh.factory<_i6.JoinCustomLeagueFormBloc>(
      () => _i6.JoinCustomLeagueFormBloc(get<_i4.ICustomLeaguesRepository>()));
  gh.factory<_i7.UtilBloc>(() => _i7.UtilBloc());
  return get;
}
