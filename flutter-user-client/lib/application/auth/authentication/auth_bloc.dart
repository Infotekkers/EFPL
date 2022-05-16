import 'package:bloc/bloc.dart';
import 'package:efpl/domain/auth/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const AuthState.intial()) {
    on<AuthCheckRequested>(
      (event, emit) async {
        final userOption = await _authFacade.getSignedInUser();
        emit(
          userOption.fold(
            () => const AuthState.unauthenticated(),
            (_) => const AuthState.authenticated(),
          ),
        );
      },
    );
    on<SignedOut>((event, emit) async {
      await _authFacade.signOut();
      emit(
        const AuthState.unauthenticated(),
      );
    });
  }
}
