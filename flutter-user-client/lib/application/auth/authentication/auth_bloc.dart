import 'package:bloc/bloc.dart';
import 'package:efpl/domain/auth/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const AuthState.intial()) {
    on<AuthCheckRequested>(
      (event, emit) async {
        final userOption = await _authRepository.getSignedInUser();

        emit(
          userOption.fold(
            () => const AuthState.unauthenticated(),
            (_) => const AuthState.authenticated(),
          ),
        );
      },
    );
    on<SignedOut>((event, emit) async {
      final failureOrSuccess = await _authRepository.removeUser();
      emit(failureOrSuccess.fold(
          (_) => AuthState.intial(), (r) => AuthState.unauthenticated()));
    });
  }
}
