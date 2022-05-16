import 'package:bloc/bloc.dart';
import 'package:efpl/domain/my_team/value_objects.dart';
import 'package:efpl/domain/player/i_player_repository.dart';
import 'package:efpl/domain/player/player.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'player_event.dart';
part 'player_state.dart';

part 'player_bloc.freezed.dart';

@injectable
class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final IPlayerRepository _iPlayerRepository;

  PlayerBloc(this._iPlayerRepository) : super(const PlayerState.initial()) {
    on<PlayerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
