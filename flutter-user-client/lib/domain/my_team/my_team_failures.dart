import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_team_failures.freezed.dart';

@freezed
abstract class MyTeamFailure with _$MyTeamFailure {
  const factory MyTeamFailure.serverError() = _ServerError;
  const factory MyTeamFailure.localDBError() = _LocalDBError;
  const factory MyTeamFailure.authError() = _AuthError;
  const factory MyTeamFailure.networkError() = _NetworkError;
}
