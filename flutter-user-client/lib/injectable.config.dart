// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/authentication/auth_bloc.dart' as _i3;
import 'application/auth/sign_in_form/bloc/sign_in_form_bloc.dart' as _i5;
import 'application/util/util_bloc.dart' as _i6;
import 'domain/auth/i_auth_facade.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthBloc>(() => _i3.AuthBloc(get<_i4.IAuthFacade>()));
  gh.factory<_i5.SignInFormBloc>(
      () => _i5.SignInFormBloc(get<_i4.IAuthFacade>()));
  gh.factory<_i6.UtilBloc>(() => _i6.UtilBloc());
  return get;
}
