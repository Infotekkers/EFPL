import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_failures.freezed.dart';

@freezed
abstract class PlayerFailure with _$PlayerFailure {
  const factory PlayerFailure.playerNotFound() = _PlayerNotFound;
  const factory PlayerFailure.serverError() = _ServerError;
  const factory PlayerFailure.networkError() = _NetworkError;
}
