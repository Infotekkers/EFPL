import 'package:efpl/domain/points/point_user_player.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'points.freezed.dart';

@freezed
abstract class PointsInfo with _$PointsInfo {
  const factory PointsInfo(
      {required List<PointUserPlayer> allPlayers,
      required int gameWeekId,
      required String teamName,
      required String activeChip,
      required int deduction,
      required int maxActiveCount}) = _PointsInfo;

  factory PointsInfo.initial() => const PointsInfo(
        allPlayers: [],
        gameWeekId: 0,
        activeChip: '',
        deduction: 0,
        maxActiveCount: 0,
        teamName: '',
      );
}
