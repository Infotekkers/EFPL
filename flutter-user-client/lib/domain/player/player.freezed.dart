// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlayerTearOff {
  const _$PlayerTearOff();

  _Player call(
      {required Name name,
      required Id playerId,
      required EplTeamId eplTeamId,
      required Position position,
      required Price currentPrice,
      required Availability availability,
      required Image image,
      List<Score> score = const [],
      List<History> history = const []}) {
    return _Player(
      name: name,
      playerId: playerId,
      eplTeamId: eplTeamId,
      position: position,
      currentPrice: currentPrice,
      availability: availability,
      image: image,
      score: score,
      history: history,
    );
  }
}

/// @nodoc
const $Player = _$PlayerTearOff();

/// @nodoc
mixin _$Player {
  Name get name => throw _privateConstructorUsedError;
  Id get playerId => throw _privateConstructorUsedError;
  EplTeamId get eplTeamId => throw _privateConstructorUsedError;
  Position get position => throw _privateConstructorUsedError;
  Price get currentPrice => throw _privateConstructorUsedError;
  Availability get availability => throw _privateConstructorUsedError;
  Image get image => throw _privateConstructorUsedError;
  List<Score> get score => throw _privateConstructorUsedError;
  List<History> get history => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res>;
  $Res call(
      {Name name,
      Id playerId,
      EplTeamId eplTeamId,
      Position position,
      Price currentPrice,
      Availability availability,
      Image image,
      List<Score> score,
      List<History> history});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res> implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  final Player _value;
  // ignore: unused_field
  final $Res Function(Player) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? playerId = freezed,
    Object? eplTeamId = freezed,
    Object? position = freezed,
    Object? currentPrice = freezed,
    Object? availability = freezed,
    Object? image = freezed,
    Object? score = freezed,
    Object? history = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as Id,
      eplTeamId: eplTeamId == freezed
          ? _value.eplTeamId
          : eplTeamId // ignore: cast_nullable_to_non_nullable
              as EplTeamId,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      currentPrice: currentPrice == freezed
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as Price,
      availability: availability == freezed
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as Availability,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as List<Score>,
      history: history == freezed
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<History>,
    ));
  }
}

/// @nodoc
abstract class _$PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$PlayerCopyWith(_Player value, $Res Function(_Player) then) =
      __$PlayerCopyWithImpl<$Res>;
  @override
  $Res call(
      {Name name,
      Id playerId,
      EplTeamId eplTeamId,
      Position position,
      Price currentPrice,
      Availability availability,
      Image image,
      List<Score> score,
      List<History> history});
}

/// @nodoc
class __$PlayerCopyWithImpl<$Res> extends _$PlayerCopyWithImpl<$Res>
    implements _$PlayerCopyWith<$Res> {
  __$PlayerCopyWithImpl(_Player _value, $Res Function(_Player) _then)
      : super(_value, (v) => _then(v as _Player));

  @override
  _Player get _value => super._value as _Player;

  @override
  $Res call({
    Object? name = freezed,
    Object? playerId = freezed,
    Object? eplTeamId = freezed,
    Object? position = freezed,
    Object? currentPrice = freezed,
    Object? availability = freezed,
    Object? image = freezed,
    Object? score = freezed,
    Object? history = freezed,
  }) {
    return _then(_Player(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      playerId: playerId == freezed
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as Id,
      eplTeamId: eplTeamId == freezed
          ? _value.eplTeamId
          : eplTeamId // ignore: cast_nullable_to_non_nullable
              as EplTeamId,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      currentPrice: currentPrice == freezed
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as Price,
      availability: availability == freezed
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as Availability,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as List<Score>,
      history: history == freezed
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<History>,
    ));
  }
}

/// @nodoc

class _$_Player implements _Player {
  const _$_Player(
      {required this.name,
      required this.playerId,
      required this.eplTeamId,
      required this.position,
      required this.currentPrice,
      required this.availability,
      required this.image,
      this.score = const [],
      this.history = const []});

  @override
  final Name name;
  @override
  final Id playerId;
  @override
  final EplTeamId eplTeamId;
  @override
  final Position position;
  @override
  final Price currentPrice;
  @override
  final Availability availability;
  @override
  final Image image;
  @JsonKey()
  @override
  final List<Score> score;
  @JsonKey()
  @override
  final List<History> history;

  @override
  String toString() {
    return 'Player(name: $name, playerId: $playerId, eplTeamId: $eplTeamId, position: $position, currentPrice: $currentPrice, availability: $availability, image: $image, score: $score, history: $history)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Player &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.playerId, playerId) &&
            const DeepCollectionEquality().equals(other.eplTeamId, eplTeamId) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality()
                .equals(other.currentPrice, currentPrice) &&
            const DeepCollectionEquality()
                .equals(other.availability, availability) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality().equals(other.history, history));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(playerId),
      const DeepCollectionEquality().hash(eplTeamId),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(currentPrice),
      const DeepCollectionEquality().hash(availability),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(history));

  @JsonKey(ignore: true)
  @override
  _$PlayerCopyWith<_Player> get copyWith =>
      __$PlayerCopyWithImpl<_Player>(this, _$identity);
}

abstract class _Player implements Player {
  const factory _Player(
      {required Name name,
      required Id playerId,
      required EplTeamId eplTeamId,
      required Position position,
      required Price currentPrice,
      required Availability availability,
      required Image image,
      List<Score> score,
      List<History> history}) = _$_Player;

  @override
  Name get name;
  @override
  Id get playerId;
  @override
  EplTeamId get eplTeamId;
  @override
  Position get position;
  @override
  Price get currentPrice;
  @override
  Availability get availability;
  @override
  Image get image;
  @override
  List<Score> get score;
  @override
  List<History> get history;
  @override
  @JsonKey(ignore: true)
  _$PlayerCopyWith<_Player> get copyWith => throw _privateConstructorUsedError;
}
