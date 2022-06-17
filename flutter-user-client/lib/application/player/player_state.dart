part of 'player_bloc.dart';

@freezed
abstract class PlayerState with _$PlayerState {
  const factory PlayerState.initial() = _Initial;
  const factory PlayerState.loadInProgress() = _LoadInProgress;
  const factory PlayerState.loadSuccess(Player player) = _LoadSuccess;
  const factory PlayerState.loadFailure(PlayerFailure playerFailure) =
      _LoadFailure;
}
