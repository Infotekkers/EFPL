// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'request_reset_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RequestResetFormEventTearOff {
  const _$RequestResetFormEventTearOff();

  EmailChanged emailChanged(String emailStr) {
    return EmailChanged(
      emailStr,
    );
  }

  RequestPressed requestPressed() {
    return const RequestPressed();
  }
}

/// @nodoc
const $RequestResetFormEvent = _$RequestResetFormEventTearOff();

/// @nodoc
mixin _$RequestResetFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function() requestPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function()? requestPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function()? requestPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(RequestPressed value) requestPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(RequestPressed value)? requestPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(RequestPressed value)? requestPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestResetFormEventCopyWith<$Res> {
  factory $RequestResetFormEventCopyWith(RequestResetFormEvent value,
          $Res Function(RequestResetFormEvent) then) =
      _$RequestResetFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RequestResetFormEventCopyWithImpl<$Res>
    implements $RequestResetFormEventCopyWith<$Res> {
  _$RequestResetFormEventCopyWithImpl(this._value, this._then);

  final RequestResetFormEvent _value;
  // ignore: unused_field
  final $Res Function(RequestResetFormEvent) _then;
}

/// @nodoc
abstract class $EmailChangedCopyWith<$Res> {
  factory $EmailChangedCopyWith(
          EmailChanged value, $Res Function(EmailChanged) then) =
      _$EmailChangedCopyWithImpl<$Res>;
  $Res call({String emailStr});
}

/// @nodoc
class _$EmailChangedCopyWithImpl<$Res>
    extends _$RequestResetFormEventCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(
      EmailChanged _value, $Res Function(EmailChanged) _then)
      : super(_value, (v) => _then(v as EmailChanged));

  @override
  EmailChanged get _value => super._value as EmailChanged;

  @override
  $Res call({
    Object? emailStr = freezed,
  }) {
    return _then(EmailChanged(
      emailStr == freezed
          ? _value.emailStr
          : emailStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.emailStr);

  @override
  final String emailStr;

  @override
  String toString() {
    return 'RequestResetFormEvent.emailChanged(emailStr: $emailStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmailChanged &&
            const DeepCollectionEquality().equals(other.emailStr, emailStr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(emailStr));

  @JsonKey(ignore: true)
  @override
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      _$EmailChangedCopyWithImpl<EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function() requestPressed,
  }) {
    return emailChanged(emailStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function()? requestPressed,
  }) {
    return emailChanged?.call(emailStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function()? requestPressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(emailStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(RequestPressed value) requestPressed,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(RequestPressed value)? requestPressed,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(RequestPressed value)? requestPressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements RequestResetFormEvent {
  const factory EmailChanged(String emailStr) = _$EmailChanged;

  String get emailStr;
  @JsonKey(ignore: true)
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestPressedCopyWith<$Res> {
  factory $RequestPressedCopyWith(
          RequestPressed value, $Res Function(RequestPressed) then) =
      _$RequestPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RequestPressedCopyWithImpl<$Res>
    extends _$RequestResetFormEventCopyWithImpl<$Res>
    implements $RequestPressedCopyWith<$Res> {
  _$RequestPressedCopyWithImpl(
      RequestPressed _value, $Res Function(RequestPressed) _then)
      : super(_value, (v) => _then(v as RequestPressed));

  @override
  RequestPressed get _value => super._value as RequestPressed;
}

/// @nodoc

class _$RequestPressed implements RequestPressed {
  const _$RequestPressed();

  @override
  String toString() {
    return 'RequestResetFormEvent.requestPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RequestPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function() requestPressed,
  }) {
    return requestPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function()? requestPressed,
  }) {
    return requestPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function()? requestPressed,
    required TResult orElse(),
  }) {
    if (requestPressed != null) {
      return requestPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(RequestPressed value) requestPressed,
  }) {
    return requestPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(RequestPressed value)? requestPressed,
  }) {
    return requestPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(RequestPressed value)? requestPressed,
    required TResult orElse(),
  }) {
    if (requestPressed != null) {
      return requestPressed(this);
    }
    return orElse();
  }
}

abstract class RequestPressed implements RequestResetFormEvent {
  const factory RequestPressed() = _$RequestPressed;
}

/// @nodoc
class _$RequestResetFormStateTearOff {
  const _$RequestResetFormStateTearOff();

  _RequestResetFormState call(
      {required EmailAddress email,
      required bool showErrorMessages,
      required bool isSubmitting,
      required Option<Either<AuthFailure, User>> authFailureOrSuccessOption}) {
    return _RequestResetFormState(
      email: email,
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $RequestResetFormState = _$RequestResetFormStateTearOff();

/// @nodoc
mixin _$RequestResetFormState {
  EmailAddress get email => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, User>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestResetFormStateCopyWith<RequestResetFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestResetFormStateCopyWith<$Res> {
  factory $RequestResetFormStateCopyWith(RequestResetFormState value,
          $Res Function(RequestResetFormState) then) =
      _$RequestResetFormStateCopyWithImpl<$Res>;
  $Res call(
      {EmailAddress email,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, User>> authFailureOrSuccessOption});
}

/// @nodoc
class _$RequestResetFormStateCopyWithImpl<$Res>
    implements $RequestResetFormStateCopyWith<$Res> {
  _$RequestResetFormStateCopyWithImpl(this._value, this._then);

  final RequestResetFormState _value;
  // ignore: unused_field
  final $Res Function(RequestResetFormState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, User>>,
    ));
  }
}

/// @nodoc
abstract class _$RequestResetFormStateCopyWith<$Res>
    implements $RequestResetFormStateCopyWith<$Res> {
  factory _$RequestResetFormStateCopyWith(_RequestResetFormState value,
          $Res Function(_RequestResetFormState) then) =
      __$RequestResetFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailAddress email,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, User>> authFailureOrSuccessOption});
}

/// @nodoc
class __$RequestResetFormStateCopyWithImpl<$Res>
    extends _$RequestResetFormStateCopyWithImpl<$Res>
    implements _$RequestResetFormStateCopyWith<$Res> {
  __$RequestResetFormStateCopyWithImpl(_RequestResetFormState _value,
      $Res Function(_RequestResetFormState) _then)
      : super(_value, (v) => _then(v as _RequestResetFormState));

  @override
  _RequestResetFormState get _value => super._value as _RequestResetFormState;

  @override
  $Res call({
    Object? email = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_RequestResetFormState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, User>>,
    ));
  }
}

/// @nodoc

class _$_RequestResetFormState implements _RequestResetFormState {
  const _$_RequestResetFormState(
      {required this.email,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final EmailAddress email;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthFailure, User>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'RequestResetFormState(email: $email, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RequestResetFormState &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality().equals(
                other.authFailureOrSuccessOption, authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(authFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$RequestResetFormStateCopyWith<_RequestResetFormState> get copyWith =>
      __$RequestResetFormStateCopyWithImpl<_RequestResetFormState>(
          this, _$identity);
}

abstract class _RequestResetFormState implements RequestResetFormState {
  const factory _RequestResetFormState(
      {required EmailAddress email,
      required bool showErrorMessages,
      required bool isSubmitting,
      required Option<Either<AuthFailure, User>>
          authFailureOrSuccessOption}) = _$_RequestResetFormState;

  @override
  EmailAddress get email;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AuthFailure, User>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$RequestResetFormStateCopyWith<_RequestResetFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
