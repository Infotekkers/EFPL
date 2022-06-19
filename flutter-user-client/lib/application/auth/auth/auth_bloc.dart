import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:efpl/domain/auth/i_auth_repository.dart';
import 'package:efpl/domain/auth/user.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:efpl/infrastructure/auth/auth_dtos.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const AuthState.intial()) {
    on<AuthCheckRequested>(
      (event, emit) async {
        final userOption = await _authRepository.getSignedInUser();
        userOption.fold(
            () => {}, (user) => {_authRepository.setSignedInUser(user: user)});
        emit(
          userOption.fold(
            () => const AuthState.unauthenticated(),
            (user) => AuthState.authenticated(user),
          ),
        );
      },
    );
    on<SignedOut>((event, emit) async {
      final failureOrSuccess = await _authRepository.removeUser();
      emit(failureOrSuccess.fold((_) => const AuthState.intial(),
          (r) => const AuthState.unauthenticated()));
    });
    on<TokenCheckRequested>((event, emit) async {
      try {
        const storage = FlutterSecureStorage();
        String? value = await storage.read(key: 'user');

        if (value == null) {
          emit(
            const AuthState.unauthorised(),
          );
        }

        final UserDto userDto =
            UserDto.fromJson(jsonDecode(value!) as Map<String, dynamic>);

        final failureOrSuccess =
            await _authRepository.checkToken(token: Token(userDto.token));
        final userOption = await _authRepository.getSignedInUser();
        User? user;
        userOption.fold(
            () {},
            (authenticatedUser) => {
                  user = authenticatedUser,
                });
        emit(
          failureOrSuccess.fold(
            (_) => const AuthState.unauthorised(),
            (_) => AuthState.authorised(user!),
          ),
        );
      } catch (e) {
        emit(
          const AuthState.unauthorised(),
        );
      }
    });
  }
}
