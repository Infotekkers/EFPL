import 'package:efpl/domain/epl_stats/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'epl_stats.freezed.dart';

@freezed
abstract class EPLStats with _$EPLStats {
  const factory EPLStats({
    required PlayerName name,
  }) = _EPLStat;
}
