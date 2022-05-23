// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/epl_stats/epl_stats_bloc.dart' as _i7;
import 'application/util/util_bloc.dart' as _i6;
import 'domain/epl_stats/i_epl_stats_repository.dart' as _i4;
import 'infrastructure/epl_stats/epl_stats_remote_data_provider.dart' as _i3;
import 'infrastructure/epl_stats/epl_stats_repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.EPLStatsRemoteDataProvider>(
      () => _i3.EPLStatsRemoteDataProvider());
  gh.lazySingleton<_i4.IEPLStatsRepository>(
      () => _i5.EPLStatsRepository(get<_i3.EPLStatsRemoteDataProvider>()));
  gh.factory<_i6.UtilBloc>(() => _i6.UtilBloc());
  gh.lazySingleton<_i7.EPLStatsBloc>(
      () => _i7.EPLStatsBloc(get<_i4.IEPLStatsRepository>()));
  return get;
}
