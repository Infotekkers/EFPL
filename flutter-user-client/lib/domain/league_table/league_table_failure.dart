import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'league_table_failure.freezed.dart';

@freezed
abstract class LeagueTableFailure with _$LeagueTableFailure {
  const factory LeagueTableFailure.serverError() = _ServerError;
  const factory LeagueTableFailure.localDBError() = _LocalDBError;
  const factory LeagueTableFailure.networkError() = _NetworkError;
}
