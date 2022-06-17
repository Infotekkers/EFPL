import 'package:freezed_annotation/freezed_annotation.dart';

part 'epl_stats_failure.freezed.dart';

@freezed
abstract class EPLStatsFailure<T> with _$EPLStatsFailure<T> {
  const factory EPLStatsFailure.serverError() = _ServerError;
  const factory EPLStatsFailure.networkError() = _NetworkError;
}
