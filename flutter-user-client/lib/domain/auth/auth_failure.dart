import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.emptyError() = EmptyError;

  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.networkError() = NetworkError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.invalidEmailPasswordCombination() =
      InvalidEmailPasswordCombination;
  const factory AuthFailure.passwordDontMatch() = PasswordDontMatch;
  const factory AuthFailure.emailNotFound() = EmailNotFound;
}
