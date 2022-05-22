// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

  EmptyError emptyError() {
    return const EmptyError();
  }

  CancelledByUser cancelledByUser() {
    return const CancelledByUser();
  }

  ServerError serverError() {
    return const ServerError();
  }

  NetworkError networkError() {
    return const NetworkError();
  }

  EmailAlreadyInUse emailAlreadyInUse() {
    return const EmailAlreadyInUse();
  }

  InvalidEmailPasswordCombination invalidEmailPasswordCombination() {
    return const InvalidEmailPasswordCombination();
  }

  PasswordDontMatch passwordDontMatch() {
    return const PasswordDontMatch();
  }

  EmailNotFound emailNotFound() {
    return const EmailNotFound();
  }
}

/// @nodoc
const $AuthFailure = _$AuthFailureTearOff();

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emptyError,
    required TResult Function() cancelledByUser,
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() invalidEmailPasswordCombination,
    required TResult Function() passwordDontMatch,
    required TResult Function() emailNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyError value) emptyError,
    required TResult Function(CancelledByUser value) cancelledByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(InvalidEmailPasswordCombination value)
        invalidEmailPasswordCombination,
    required TResult Function(PasswordDontMatch value) passwordDontMatch,
    required TResult Function(EmailNotFound value) emailNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

/// @nodoc
abstract class $EmptyErrorCopyWith<$Res> {
  factory $EmptyErrorCopyWith(
          EmptyError value, $Res Function(EmptyError) then) =
      _$EmptyErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmptyErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $EmptyErrorCopyWith<$Res> {
  _$EmptyErrorCopyWithImpl(EmptyError _value, $Res Function(EmptyError) _then)
      : super(_value, (v) => _then(v as EmptyError));

  @override
  EmptyError get _value => super._value as EmptyError;
}

/// @nodoc

class _$EmptyError with DiagnosticableTreeMixin implements EmptyError {
  const _$EmptyError();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthFailure.emptyError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthFailure.emptyError'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmptyError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emptyError,
    required TResult Function() cancelledByUser,
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() invalidEmailPasswordCombination,
    required TResult Function() passwordDontMatch,
    required TResult Function() emailNotFound,
  }) {
    return emptyError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
  }) {
    return emptyError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
    required TResult orElse(),
  }) {
    if (emptyError != null) {
      return emptyError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyError value) emptyError,
    required TResult Function(CancelledByUser value) cancelledByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(InvalidEmailPasswordCombination value)
        invalidEmailPasswordCombination,
    required TResult Function(PasswordDontMatch value) passwordDontMatch,
    required TResult Function(EmailNotFound value) emailNotFound,
  }) {
    return emptyError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
  }) {
    return emptyError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (emptyError != null) {
      return emptyError(this);
    }
    return orElse();
  }
}

abstract class EmptyError implements AuthFailure {
  const factory EmptyError() = _$EmptyError;
}

/// @nodoc
abstract class $CancelledByUserCopyWith<$Res> {
  factory $CancelledByUserCopyWith(
          CancelledByUser value, $Res Function(CancelledByUser) then) =
      _$CancelledByUserCopyWithImpl<$Res>;
}

/// @nodoc
class _$CancelledByUserCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $CancelledByUserCopyWith<$Res> {
  _$CancelledByUserCopyWithImpl(
      CancelledByUser _value, $Res Function(CancelledByUser) _then)
      : super(_value, (v) => _then(v as CancelledByUser));

  @override
  CancelledByUser get _value => super._value as CancelledByUser;
}

/// @nodoc

class _$CancelledByUser
    with DiagnosticableTreeMixin
    implements CancelledByUser {
  const _$CancelledByUser();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthFailure.cancelledByUser()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthFailure.cancelledByUser'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CancelledByUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emptyError,
    required TResult Function() cancelledByUser,
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() invalidEmailPasswordCombination,
    required TResult Function() passwordDontMatch,
    required TResult Function() emailNotFound,
  }) {
    return cancelledByUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
  }) {
    return cancelledByUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
    required TResult orElse(),
  }) {
    if (cancelledByUser != null) {
      return cancelledByUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyError value) emptyError,
    required TResult Function(CancelledByUser value) cancelledByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(InvalidEmailPasswordCombination value)
        invalidEmailPasswordCombination,
    required TResult Function(PasswordDontMatch value) passwordDontMatch,
    required TResult Function(EmailNotFound value) emailNotFound,
  }) {
    return cancelledByUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
  }) {
    return cancelledByUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (cancelledByUser != null) {
      return cancelledByUser(this);
    }
    return orElse();
  }
}

abstract class CancelledByUser implements AuthFailure {
  const factory CancelledByUser() = _$CancelledByUser;
}

/// @nodoc
abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;
}

/// @nodoc

class _$ServerError with DiagnosticableTreeMixin implements ServerError {
  const _$ServerError();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthFailure.serverError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthFailure.serverError'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emptyError,
    required TResult Function() cancelledByUser,
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() invalidEmailPasswordCombination,
    required TResult Function() passwordDontMatch,
    required TResult Function() emailNotFound,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyError value) emptyError,
    required TResult Function(CancelledByUser value) cancelledByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(InvalidEmailPasswordCombination value)
        invalidEmailPasswordCombination,
    required TResult Function(PasswordDontMatch value) passwordDontMatch,
    required TResult Function(EmailNotFound value) emailNotFound,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements AuthFailure {
  const factory ServerError() = _$ServerError;
}

/// @nodoc
abstract class $NetworkErrorCopyWith<$Res> {
  factory $NetworkErrorCopyWith(
          NetworkError value, $Res Function(NetworkError) then) =
      _$NetworkErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetworkErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $NetworkErrorCopyWith<$Res> {
  _$NetworkErrorCopyWithImpl(
      NetworkError _value, $Res Function(NetworkError) _then)
      : super(_value, (v) => _then(v as NetworkError));

  @override
  NetworkError get _value => super._value as NetworkError;
}

/// @nodoc

class _$NetworkError with DiagnosticableTreeMixin implements NetworkError {
  const _$NetworkError();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthFailure.networkError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthFailure.networkError'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NetworkError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emptyError,
    required TResult Function() cancelledByUser,
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() invalidEmailPasswordCombination,
    required TResult Function() passwordDontMatch,
    required TResult Function() emailNotFound,
  }) {
    return networkError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
  }) {
    return networkError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyError value) emptyError,
    required TResult Function(CancelledByUser value) cancelledByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(InvalidEmailPasswordCombination value)
        invalidEmailPasswordCombination,
    required TResult Function(PasswordDontMatch value) passwordDontMatch,
    required TResult Function(EmailNotFound value) emailNotFound,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkError implements AuthFailure {
  const factory NetworkError() = _$NetworkError;
}

/// @nodoc
abstract class $EmailAlreadyInUseCopyWith<$Res> {
  factory $EmailAlreadyInUseCopyWith(
          EmailAlreadyInUse value, $Res Function(EmailAlreadyInUse) then) =
      _$EmailAlreadyInUseCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmailAlreadyInUseCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $EmailAlreadyInUseCopyWith<$Res> {
  _$EmailAlreadyInUseCopyWithImpl(
      EmailAlreadyInUse _value, $Res Function(EmailAlreadyInUse) _then)
      : super(_value, (v) => _then(v as EmailAlreadyInUse));

  @override
  EmailAlreadyInUse get _value => super._value as EmailAlreadyInUse;
}

/// @nodoc

class _$EmailAlreadyInUse
    with DiagnosticableTreeMixin
    implements EmailAlreadyInUse {
  const _$EmailAlreadyInUse();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthFailure.emailAlreadyInUse()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'AuthFailure.emailAlreadyInUse'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmailAlreadyInUse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emptyError,
    required TResult Function() cancelledByUser,
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() invalidEmailPasswordCombination,
    required TResult Function() passwordDontMatch,
    required TResult Function() emailNotFound,
  }) {
    return emailAlreadyInUse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
  }) {
    return emailAlreadyInUse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyError value) emptyError,
    required TResult Function(CancelledByUser value) cancelledByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(InvalidEmailPasswordCombination value)
        invalidEmailPasswordCombination,
    required TResult Function(PasswordDontMatch value) passwordDontMatch,
    required TResult Function(EmailNotFound value) emailNotFound,
  }) {
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
  }) {
    return emailAlreadyInUse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class EmailAlreadyInUse implements AuthFailure {
  const factory EmailAlreadyInUse() = _$EmailAlreadyInUse;
}

/// @nodoc
abstract class $InvalidEmailPasswordCombinationCopyWith<$Res> {
  factory $InvalidEmailPasswordCombinationCopyWith(
          InvalidEmailPasswordCombination value,
          $Res Function(InvalidEmailPasswordCombination) then) =
      _$InvalidEmailPasswordCombinationCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvalidEmailPasswordCombinationCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $InvalidEmailPasswordCombinationCopyWith<$Res> {
  _$InvalidEmailPasswordCombinationCopyWithImpl(
      InvalidEmailPasswordCombination _value,
      $Res Function(InvalidEmailPasswordCombination) _then)
      : super(_value, (v) => _then(v as InvalidEmailPasswordCombination));

  @override
  InvalidEmailPasswordCombination get _value =>
      super._value as InvalidEmailPasswordCombination;
}

/// @nodoc

class _$InvalidEmailPasswordCombination
    with DiagnosticableTreeMixin
    implements InvalidEmailPasswordCombination {
  const _$InvalidEmailPasswordCombination();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthFailure.invalidEmailPasswordCombination()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty(
        'type', 'AuthFailure.invalidEmailPasswordCombination'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidEmailPasswordCombination);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emptyError,
    required TResult Function() cancelledByUser,
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() invalidEmailPasswordCombination,
    required TResult Function() passwordDontMatch,
    required TResult Function() emailNotFound,
  }) {
    return invalidEmailPasswordCombination();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
  }) {
    return invalidEmailPasswordCombination?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
    required TResult orElse(),
  }) {
    if (invalidEmailPasswordCombination != null) {
      return invalidEmailPasswordCombination();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyError value) emptyError,
    required TResult Function(CancelledByUser value) cancelledByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(InvalidEmailPasswordCombination value)
        invalidEmailPasswordCombination,
    required TResult Function(PasswordDontMatch value) passwordDontMatch,
    required TResult Function(EmailNotFound value) emailNotFound,
  }) {
    return invalidEmailPasswordCombination(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
  }) {
    return invalidEmailPasswordCombination?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (invalidEmailPasswordCombination != null) {
      return invalidEmailPasswordCombination(this);
    }
    return orElse();
  }
}

abstract class InvalidEmailPasswordCombination implements AuthFailure {
  const factory InvalidEmailPasswordCombination() =
      _$InvalidEmailPasswordCombination;
}

/// @nodoc
abstract class $PasswordDontMatchCopyWith<$Res> {
  factory $PasswordDontMatchCopyWith(
          PasswordDontMatch value, $Res Function(PasswordDontMatch) then) =
      _$PasswordDontMatchCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasswordDontMatchCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $PasswordDontMatchCopyWith<$Res> {
  _$PasswordDontMatchCopyWithImpl(
      PasswordDontMatch _value, $Res Function(PasswordDontMatch) _then)
      : super(_value, (v) => _then(v as PasswordDontMatch));

  @override
  PasswordDontMatch get _value => super._value as PasswordDontMatch;
}

/// @nodoc

class _$PasswordDontMatch
    with DiagnosticableTreeMixin
    implements PasswordDontMatch {
  const _$PasswordDontMatch();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthFailure.passwordDontMatch()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'AuthFailure.passwordDontMatch'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordDontMatch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emptyError,
    required TResult Function() cancelledByUser,
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() invalidEmailPasswordCombination,
    required TResult Function() passwordDontMatch,
    required TResult Function() emailNotFound,
  }) {
    return passwordDontMatch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
  }) {
    return passwordDontMatch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
    required TResult orElse(),
  }) {
    if (passwordDontMatch != null) {
      return passwordDontMatch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyError value) emptyError,
    required TResult Function(CancelledByUser value) cancelledByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(InvalidEmailPasswordCombination value)
        invalidEmailPasswordCombination,
    required TResult Function(PasswordDontMatch value) passwordDontMatch,
    required TResult Function(EmailNotFound value) emailNotFound,
  }) {
    return passwordDontMatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
  }) {
    return passwordDontMatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (passwordDontMatch != null) {
      return passwordDontMatch(this);
    }
    return orElse();
  }
}

abstract class PasswordDontMatch implements AuthFailure {
  const factory PasswordDontMatch() = _$PasswordDontMatch;
}

/// @nodoc
abstract class $EmailNotFoundCopyWith<$Res> {
  factory $EmailNotFoundCopyWith(
          EmailNotFound value, $Res Function(EmailNotFound) then) =
      _$EmailNotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmailNotFoundCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $EmailNotFoundCopyWith<$Res> {
  _$EmailNotFoundCopyWithImpl(
      EmailNotFound _value, $Res Function(EmailNotFound) _then)
      : super(_value, (v) => _then(v as EmailNotFound));

  @override
  EmailNotFound get _value => super._value as EmailNotFound;
}

/// @nodoc

class _$EmailNotFound with DiagnosticableTreeMixin implements EmailNotFound {
  const _$EmailNotFound();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthFailure.emailNotFound()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AuthFailure.emailNotFound'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmailNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emptyError,
    required TResult Function() cancelledByUser,
    required TResult Function() serverError,
    required TResult Function() networkError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() invalidEmailPasswordCombination,
    required TResult Function() passwordDontMatch,
    required TResult Function() emailNotFound,
  }) {
    return emailNotFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
  }) {
    return emailNotFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emptyError,
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    TResult Function()? networkError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? invalidEmailPasswordCombination,
    TResult Function()? passwordDontMatch,
    TResult Function()? emailNotFound,
    required TResult orElse(),
  }) {
    if (emailNotFound != null) {
      return emailNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyError value) emptyError,
    required TResult Function(CancelledByUser value) cancelledByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(InvalidEmailPasswordCombination value)
        invalidEmailPasswordCombination,
    required TResult Function(PasswordDontMatch value) passwordDontMatch,
    required TResult Function(EmailNotFound value) emailNotFound,
  }) {
    return emailNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
  }) {
    return emailNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyError value)? emptyError,
    TResult Function(CancelledByUser value)? cancelledByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(InvalidEmailPasswordCombination value)?
        invalidEmailPasswordCombination,
    TResult Function(PasswordDontMatch value)? passwordDontMatch,
    TResult Function(EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (emailNotFound != null) {
      return emailNotFound(this);
    }
    return orElse();
  }
}

abstract class EmailNotFound implements AuthFailure {
  const factory EmailNotFound() = _$EmailNotFound;
}
