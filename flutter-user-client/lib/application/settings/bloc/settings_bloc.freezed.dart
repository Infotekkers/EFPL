// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SettingsEventTearOff {
  const _$SettingsEventTearOff();

  _LoadUserDetail loadUserDetail(String userId) {
    return _LoadUserDetail(
      userId,
    );
  }

  _UpdateSettings updateUserDetail(
      Settings settings, String userId, String updateType) {
    return _UpdateSettings(
      settings,
      userId,
      updateType,
    );
  }
}

/// @nodoc
const $SettingsEvent = _$SettingsEventTearOff();

/// @nodoc
mixin _$SettingsEvent {
  String get userId => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUserDetail,
    required TResult Function(
            Settings settings, String userId, String updateType)
        updateUserDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? loadUserDetail,
    TResult Function(Settings settings, String userId, String updateType)?
        updateUserDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUserDetail,
    TResult Function(Settings settings, String userId, String updateType)?
        updateUserDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUserDetail value) loadUserDetail,
    required TResult Function(_UpdateSettings value) updateUserDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadUserDetail value)? loadUserDetail,
    TResult Function(_UpdateSettings value)? updateUserDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUserDetail value)? loadUserDetail,
    TResult Function(_UpdateSettings value)? updateUserDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsEventCopyWith<SettingsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  final SettingsEvent _value;
  // ignore: unused_field
  final $Res Function(SettingsEvent) _then;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LoadUserDetailCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory _$LoadUserDetailCopyWith(
          _LoadUserDetail value, $Res Function(_LoadUserDetail) then) =
      __$LoadUserDetailCopyWithImpl<$Res>;
  @override
  $Res call({String userId});
}

/// @nodoc
class __$LoadUserDetailCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$LoadUserDetailCopyWith<$Res> {
  __$LoadUserDetailCopyWithImpl(
      _LoadUserDetail _value, $Res Function(_LoadUserDetail) _then)
      : super(_value, (v) => _then(v as _LoadUserDetail));

  @override
  _LoadUserDetail get _value => super._value as _LoadUserDetail;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_LoadUserDetail(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoadUserDetail implements _LoadUserDetail {
  const _$_LoadUserDetail(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'SettingsEvent.loadUserDetail(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadUserDetail &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$LoadUserDetailCopyWith<_LoadUserDetail> get copyWith =>
      __$LoadUserDetailCopyWithImpl<_LoadUserDetail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUserDetail,
    required TResult Function(
            Settings settings, String userId, String updateType)
        updateUserDetail,
  }) {
    return loadUserDetail(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? loadUserDetail,
    TResult Function(Settings settings, String userId, String updateType)?
        updateUserDetail,
  }) {
    return loadUserDetail?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUserDetail,
    TResult Function(Settings settings, String userId, String updateType)?
        updateUserDetail,
    required TResult orElse(),
  }) {
    if (loadUserDetail != null) {
      return loadUserDetail(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUserDetail value) loadUserDetail,
    required TResult Function(_UpdateSettings value) updateUserDetail,
  }) {
    return loadUserDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadUserDetail value)? loadUserDetail,
    TResult Function(_UpdateSettings value)? updateUserDetail,
  }) {
    return loadUserDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUserDetail value)? loadUserDetail,
    TResult Function(_UpdateSettings value)? updateUserDetail,
    required TResult orElse(),
  }) {
    if (loadUserDetail != null) {
      return loadUserDetail(this);
    }
    return orElse();
  }
}

abstract class _LoadUserDetail implements SettingsEvent {
  const factory _LoadUserDetail(String userId) = _$_LoadUserDetail;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$LoadUserDetailCopyWith<_LoadUserDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateSettingsCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory _$UpdateSettingsCopyWith(
          _UpdateSettings value, $Res Function(_UpdateSettings) then) =
      __$UpdateSettingsCopyWithImpl<$Res>;
  @override
  $Res call({Settings settings, String userId, String updateType});

  $SettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$UpdateSettingsCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$UpdateSettingsCopyWith<$Res> {
  __$UpdateSettingsCopyWithImpl(
      _UpdateSettings _value, $Res Function(_UpdateSettings) _then)
      : super(_value, (v) => _then(v as _UpdateSettings));

  @override
  _UpdateSettings get _value => super._value as _UpdateSettings;

  @override
  $Res call({
    Object? settings = freezed,
    Object? userId = freezed,
    Object? updateType = freezed,
  }) {
    return _then(_UpdateSettings(
      settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      updateType == freezed
          ? _value.updateType
          : updateType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $SettingsCopyWith<$Res> get settings {
    return $SettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

/// @nodoc

class _$_UpdateSettings implements _UpdateSettings {
  const _$_UpdateSettings(this.settings, this.userId, this.updateType);

  @override
  final Settings settings;
  @override
  final String userId;
  @override
  final String updateType;

  @override
  String toString() {
    return 'SettingsEvent.updateUserDetail(settings: $settings, userId: $userId, updateType: $updateType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateSettings &&
            const DeepCollectionEquality().equals(other.settings, settings) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.updateType, updateType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(settings),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(updateType));

  @JsonKey(ignore: true)
  @override
  _$UpdateSettingsCopyWith<_UpdateSettings> get copyWith =>
      __$UpdateSettingsCopyWithImpl<_UpdateSettings>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUserDetail,
    required TResult Function(
            Settings settings, String userId, String updateType)
        updateUserDetail,
  }) {
    return updateUserDetail(settings, userId, updateType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? loadUserDetail,
    TResult Function(Settings settings, String userId, String updateType)?
        updateUserDetail,
  }) {
    return updateUserDetail?.call(settings, userId, updateType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUserDetail,
    TResult Function(Settings settings, String userId, String updateType)?
        updateUserDetail,
    required TResult orElse(),
  }) {
    if (updateUserDetail != null) {
      return updateUserDetail(settings, userId, updateType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUserDetail value) loadUserDetail,
    required TResult Function(_UpdateSettings value) updateUserDetail,
  }) {
    return updateUserDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadUserDetail value)? loadUserDetail,
    TResult Function(_UpdateSettings value)? updateUserDetail,
  }) {
    return updateUserDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUserDetail value)? loadUserDetail,
    TResult Function(_UpdateSettings value)? updateUserDetail,
    required TResult orElse(),
  }) {
    if (updateUserDetail != null) {
      return updateUserDetail(this);
    }
    return orElse();
  }
}

abstract class _UpdateSettings implements SettingsEvent {
  const factory _UpdateSettings(
      Settings settings, String userId, String updateType) = _$_UpdateSettings;

  Settings get settings;
  @override
  String get userId;
  String get updateType;
  @override
  @JsonKey(ignore: true)
  _$UpdateSettingsCopyWith<_UpdateSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SettingsStateTearOff {
  const _$SettingsStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loadInProgress() {
    return const _Loading();
  }

  _LoadSuccess loadSuccess(Settings settings) {
    return _LoadSuccess(
      settings,
    );
  }

  _LoadFailure loadFailure(SettingsFailure settingsFailure) {
    return _LoadFailure(
      settingsFailure,
    );
  }

  _UpdateSettingsSuccess settingsUpdateSuccess(String message) {
    return _UpdateSettingsSuccess(
      message,
    );
  }
}

/// @nodoc
const $SettingsState = _$SettingsStateTearOff();

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Settings settings) loadSuccess,
    required TResult Function(SettingsFailure settingsFailure) loadFailure,
    required TResult Function(String message) settingsUpdateSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Settings settings)? loadSuccess,
    TResult Function(SettingsFailure settingsFailure)? loadFailure,
    TResult Function(String message)? settingsUpdateSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Settings settings)? loadSuccess,
    TResult Function(SettingsFailure settingsFailure)? loadFailure,
    TResult Function(String message)? settingsUpdateSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_UpdateSettingsSuccess value)
        settingsUpdateSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_UpdateSettingsSuccess value)? settingsUpdateSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_UpdateSettingsSuccess value)? settingsUpdateSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$SettingsStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SettingsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Settings settings) loadSuccess,
    required TResult Function(SettingsFailure settingsFailure) loadFailure,
    required TResult Function(String message) settingsUpdateSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Settings settings)? loadSuccess,
    TResult Function(SettingsFailure settingsFailure)? loadFailure,
    TResult Function(String message)? settingsUpdateSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Settings settings)? loadSuccess,
    TResult Function(SettingsFailure settingsFailure)? loadFailure,
    TResult Function(String message)? settingsUpdateSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_UpdateSettingsSuccess value)
        settingsUpdateSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_UpdateSettingsSuccess value)? settingsUpdateSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_UpdateSettingsSuccess value)? settingsUpdateSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SettingsState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$SettingsStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'SettingsState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Settings settings) loadSuccess,
    required TResult Function(SettingsFailure settingsFailure) loadFailure,
    required TResult Function(String message) settingsUpdateSuccess,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Settings settings)? loadSuccess,
    TResult Function(SettingsFailure settingsFailure)? loadFailure,
    TResult Function(String message)? settingsUpdateSuccess,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Settings settings)? loadSuccess,
    TResult Function(SettingsFailure settingsFailure)? loadFailure,
    TResult Function(String message)? settingsUpdateSuccess,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_UpdateSettingsSuccess value)
        settingsUpdateSuccess,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_UpdateSettingsSuccess value)? settingsUpdateSuccess,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_UpdateSettingsSuccess value)? settingsUpdateSuccess,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SettingsState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  $Res call({Settings settings});

  $SettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res> extends _$SettingsStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object? settings = freezed,
  }) {
    return _then(_LoadSuccess(
      settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
    ));
  }

  @override
  $SettingsCopyWith<$Res> get settings {
    return $SettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

/// @nodoc

class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.settings);

  @override
  final Settings settings;

  @override
  String toString() {
    return 'SettingsState.loadSuccess(settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadSuccess &&
            const DeepCollectionEquality().equals(other.settings, settings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(settings));

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Settings settings) loadSuccess,
    required TResult Function(SettingsFailure settingsFailure) loadFailure,
    required TResult Function(String message) settingsUpdateSuccess,
  }) {
    return loadSuccess(settings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Settings settings)? loadSuccess,
    TResult Function(SettingsFailure settingsFailure)? loadFailure,
    TResult Function(String message)? settingsUpdateSuccess,
  }) {
    return loadSuccess?.call(settings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Settings settings)? loadSuccess,
    TResult Function(SettingsFailure settingsFailure)? loadFailure,
    TResult Function(String message)? settingsUpdateSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(settings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_UpdateSettingsSuccess value)
        settingsUpdateSuccess,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_UpdateSettingsSuccess value)? settingsUpdateSuccess,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_UpdateSettingsSuccess value)? settingsUpdateSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements SettingsState {
  const factory _LoadSuccess(Settings settings) = _$_LoadSuccess;

  Settings get settings;
  @JsonKey(ignore: true)
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadFailureCopyWith<$Res> {
  factory _$LoadFailureCopyWith(
          _LoadFailure value, $Res Function(_LoadFailure) then) =
      __$LoadFailureCopyWithImpl<$Res>;
  $Res call({SettingsFailure settingsFailure});

  $SettingsFailureCopyWith<$Res> get settingsFailure;
}

/// @nodoc
class __$LoadFailureCopyWithImpl<$Res> extends _$SettingsStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;

  @override
  $Res call({
    Object? settingsFailure = freezed,
  }) {
    return _then(_LoadFailure(
      settingsFailure == freezed
          ? _value.settingsFailure
          : settingsFailure // ignore: cast_nullable_to_non_nullable
              as SettingsFailure,
    ));
  }

  @override
  $SettingsFailureCopyWith<$Res> get settingsFailure {
    return $SettingsFailureCopyWith<$Res>(_value.settingsFailure, (value) {
      return _then(_value.copyWith(settingsFailure: value));
    });
  }
}

/// @nodoc

class _$_LoadFailure implements _LoadFailure {
  const _$_LoadFailure(this.settingsFailure);

  @override
  final SettingsFailure settingsFailure;

  @override
  String toString() {
    return 'SettingsState.loadFailure(settingsFailure: $settingsFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadFailure &&
            const DeepCollectionEquality()
                .equals(other.settingsFailure, settingsFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(settingsFailure));

  @JsonKey(ignore: true)
  @override
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      __$LoadFailureCopyWithImpl<_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Settings settings) loadSuccess,
    required TResult Function(SettingsFailure settingsFailure) loadFailure,
    required TResult Function(String message) settingsUpdateSuccess,
  }) {
    return loadFailure(settingsFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Settings settings)? loadSuccess,
    TResult Function(SettingsFailure settingsFailure)? loadFailure,
    TResult Function(String message)? settingsUpdateSuccess,
  }) {
    return loadFailure?.call(settingsFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Settings settings)? loadSuccess,
    TResult Function(SettingsFailure settingsFailure)? loadFailure,
    TResult Function(String message)? settingsUpdateSuccess,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(settingsFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_UpdateSettingsSuccess value)
        settingsUpdateSuccess,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_UpdateSettingsSuccess value)? settingsUpdateSuccess,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_UpdateSettingsSuccess value)? settingsUpdateSuccess,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure implements SettingsState {
  const factory _LoadFailure(SettingsFailure settingsFailure) = _$_LoadFailure;

  SettingsFailure get settingsFailure;
  @JsonKey(ignore: true)
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateSettingsSuccessCopyWith<$Res> {
  factory _$UpdateSettingsSuccessCopyWith(_UpdateSettingsSuccess value,
          $Res Function(_UpdateSettingsSuccess) then) =
      __$UpdateSettingsSuccessCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$UpdateSettingsSuccessCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$UpdateSettingsSuccessCopyWith<$Res> {
  __$UpdateSettingsSuccessCopyWithImpl(_UpdateSettingsSuccess _value,
      $Res Function(_UpdateSettingsSuccess) _then)
      : super(_value, (v) => _then(v as _UpdateSettingsSuccess));

  @override
  _UpdateSettingsSuccess get _value => super._value as _UpdateSettingsSuccess;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_UpdateSettingsSuccess(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateSettingsSuccess implements _UpdateSettingsSuccess {
  const _$_UpdateSettingsSuccess(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SettingsState.settingsUpdateSuccess(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateSettingsSuccess &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$UpdateSettingsSuccessCopyWith<_UpdateSettingsSuccess> get copyWith =>
      __$UpdateSettingsSuccessCopyWithImpl<_UpdateSettingsSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Settings settings) loadSuccess,
    required TResult Function(SettingsFailure settingsFailure) loadFailure,
    required TResult Function(String message) settingsUpdateSuccess,
  }) {
    return settingsUpdateSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Settings settings)? loadSuccess,
    TResult Function(SettingsFailure settingsFailure)? loadFailure,
    TResult Function(String message)? settingsUpdateSuccess,
  }) {
    return settingsUpdateSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Settings settings)? loadSuccess,
    TResult Function(SettingsFailure settingsFailure)? loadFailure,
    TResult Function(String message)? settingsUpdateSuccess,
    required TResult orElse(),
  }) {
    if (settingsUpdateSuccess != null) {
      return settingsUpdateSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
    required TResult Function(_UpdateSettingsSuccess value)
        settingsUpdateSuccess,
  }) {
    return settingsUpdateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_UpdateSettingsSuccess value)? settingsUpdateSuccess,
  }) {
    return settingsUpdateSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    TResult Function(_UpdateSettingsSuccess value)? settingsUpdateSuccess,
    required TResult orElse(),
  }) {
    if (settingsUpdateSuccess != null) {
      return settingsUpdateSuccess(this);
    }
    return orElse();
  }
}

abstract class _UpdateSettingsSuccess implements SettingsState {
  const factory _UpdateSettingsSuccess(String message) =
      _$_UpdateSettingsSuccess;

  String get message;
  @JsonKey(ignore: true)
  _$UpdateSettingsSuccessCopyWith<_UpdateSettingsSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
