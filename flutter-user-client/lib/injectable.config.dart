// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/fixture/fixture_bloc.dart' as _i3;
import 'application/transfer/transfer_bloc.dart' as _i5;
import 'application/util/util_bloc.dart' as _i7;
import 'domain/fixture/i_fixture_facade.dart' as _i4;
import 'domain/transfer/i_user_players_facade.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.FixtureBloc>(
      () => _i3.FixtureBloc(get<_i4.IFixtureRepository>()));
  gh.lazySingleton<_i5.TransferBloc>(
      () => _i5.TransferBloc(get<_i6.ITransferRepository>()));
  gh.lazySingleton<_i7.UtilBloc>(() => _i7.UtilBloc());
  return get;
}
