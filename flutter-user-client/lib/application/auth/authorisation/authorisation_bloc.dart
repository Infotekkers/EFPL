import 'package:bloc/bloc.dart';
import 'package:efpl/domain/auth/i_auth_repository.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'authorisation_event.dart';
part 'authorisation_state.dart';

part 'authorisation_bloc.freezed.dart';

@injectable
class AuthorisationBloc extends Bloc<AuthorisationEvent, AuthorisationState> {
  final IAuthRepository _authRepository;
  AuthorisationBloc(this._authRepository)
      : super(const AuthorisationState.initial()) {
    on<AuthorisationCheckRequested>((event, emit) async {
      await _authRepository.checkToken(
          token: Token(
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiNjI4YTI0YTY3Yzc3MzRjZGI5NzYwMDA0IiwiaWF0IjoxNjUzODI0NTE1LCJleHAiOjE2NTM4MjgxMTV9.kr7peu11cUqLDcjwlpNAGojjFXE90rqW68n3K1DkZDc"));
    });
  }
}
