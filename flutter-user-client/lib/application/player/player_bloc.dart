import 'package:bloc/bloc.dart';
import 'package:efpl/domain/player/i_player_repository.dart';
import 'package:efpl/domain/player/player.dart';
import 'package:efpl/domain/player/player_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'player_event.dart';
part 'player_state.dart';

part 'player_bloc.freezed.dart';

@injectable
class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final IPlayerRepository iPlayerRepository;

  PlayerBloc(this.iPlayerRepository) : super(const PlayerState.initial()) {
    on<_GetPlayer>(_onGetPlayer);
  }
  void _onGetPlayer(_GetPlayer e, Emitter<PlayerState> emit) async {
    emit(const PlayerState.loadInProgress());

    final failureOrSuccess = await iPlayerRepository.getPlayer(e.playerId);

    failureOrSuccess.fold(
      (failure) => emit(
        PlayerState.loadFailure(failure),
      ),
      (player) => emit(
        PlayerState.loadSuccess(player),
      ),
    );
  }
}
