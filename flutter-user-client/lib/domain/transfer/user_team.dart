import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_team.freezed.dart';

@freezed
abstract class UserTeam with _$UserTeam {
  const factory UserTeam({
    required GameWeekId gameWeekId,
    required List<UserPlayer> allUserPlayers,
    required int freeTransfers,
    required int deduction,
    required String activeChip,
  }) = _UserTeam;

  factory UserTeam.initial() => UserTeam(
        gameWeekId: GameWeekId(value: 1),
        allUserPlayers: [],
        freeTransfers: 1,
        deduction: 0,
        activeChip: "",
      );
}
