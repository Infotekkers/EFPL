// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth/auth_bloc.dart' as _i19;
import 'application/auth/register_form/register_form_bloc.dart' as _i13;
import 'application/auth/request_reset_form/request_reset_form_bloc.dart'
    as _i14;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i15;
import 'application/fixture/fixture_bloc.dart' as _i3;
import 'application/my_team/myteam_bloc.dart' as _i24;
import 'application/player/player_bloc.dart' as _i25;
import 'application/points/points_bloc.dart' as _i11;
import 'application/transfer/transfer_bloc.dart' as _i16;
import 'application/util/util_bloc.dart' as _i18;
import 'domain/auth/i_auth_repository.dart' as _i6;
import 'domain/fixture/i_fixture_facade.dart' as _i4;
import 'domain/my_team/i_my_team_repository.dart' as _i20;
import 'domain/player/i_player_repository.dart' as _i22;
import 'domain/points/i_points_facade.dart' as _i12;
import 'domain/transfer/i_user_players_facade.dart' as _i17;
import 'infrastructure/auth/auth_repository.dart' as _i7;
import 'infrastructure/my_team/my_team_local_data_provider.dart' as _i8;
import 'infrastructure/my_team/my_team_remote_data_provider.dart' as _i9;
import 'infrastructure/my_team/my_team_repository.dart' as _i21;
import 'infrastructure/player/player_remote_data_provider.dart' as _i10;
import 'infrastructure/player/player_repository.dart' as _i23;
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
  gh.lazySingleton<_i6.IAuthRepository>(() => _i7.AuthRepository());
  gh.factory<_i8.MyTeamLocalDataProvider>(() => _i8.MyTeamLocalDataProvider());
  gh.factory<_i9.MyTeamRemoteDataProvider>(
      () => _i9.MyTeamRemoteDataProvider());
  gh.factory<_i10.PlayerRemoteDataProvider>(
      () => _i10.PlayerRemoteDataProvider());
  gh.lazySingleton<_i11.PointsBloc>(
      () => _i11.PointsBloc(get<_i12.IPointInfoRepository>()));
  gh.factory<_i13.RegisterFormBloc>(
      () => _i13.RegisterFormBloc(get<_i6.IAuthRepository>()));
  gh.factory<_i14.RequestResetFormBloc>(
      () => _i14.RequestResetFormBloc(get<_i6.IAuthRepository>()));
  gh.factory<_i15.SignInFormBloc>(
      () => _i15.SignInFormBloc(get<_i6.IAuthRepository>()));
  gh.lazySingleton<_i16.TransferBloc>(
      () => _i16.TransferBloc(get<_i17.ITransferRepository>()));
  gh.lazySingleton<_i18.UtilBloc>(() => _i18.UtilBloc());
  gh.factory<_i19.AuthBloc>(() => _i19.AuthBloc(get<_i6.IAuthRepository>()));
  gh.lazySingleton<_i20.IMyTeamRepository>(() => _i21.MyTeamRepository(
      get<_i8.MyTeamLocalDataProvider>(), get<_i9.MyTeamRemoteDataProvider>()));
  gh.lazySingleton<_i22.IPlayerRepository>(
      () => _i23.PlayerRepository(get<_i10.PlayerRemoteDataProvider>()));
  gh.lazySingleton<_i24.MyTeamBloc>(
      () => _i24.MyTeamBloc(get<_i20.IMyTeamRepository>()));
  gh.factory<_i25.PlayerBloc>(
      () => _i25.PlayerBloc(get<_i22.IPlayerRepository>()));
  return get;
}
