import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_team.freezed.dart';

@freezed
abstract class UserTeam with _$UserTeam {
  const factory UserTeam({
    required GameWeekId gameWeekId,
    required String gameWeekDeadline,
    required List<UserPlayer> allUserPlayers,
    required int freeTransfers,
    required int deduction,
    required String activeChip,
    required List availableChips,
    required double maxBudget,
    required String teamName,
  }) = _UserTeam;

  factory UserTeam.initial() => UserTeam(
        gameWeekId: GameWeekId(value: 1),
        gameWeekDeadline: "",
        allUserPlayers: [],
        freeTransfers: 1,
        deduction: 0,
        activeChip: "",
        availableChips: [],
        maxBudget: 0,
        teamName: "",
      );
}
