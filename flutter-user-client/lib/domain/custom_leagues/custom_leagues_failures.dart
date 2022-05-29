import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_leagues_failures.freezed.dart';

@freezed
abstract class ClassicLeagueFailures<T> with _$ClassicLeagueFailures<T> {
  const factory ClassicLeagueFailures.invalidLeagueId(
      {required String leagueCode}) = InvalidLeagueCode<T>;

  const factory ClassicLeagueFailures.networkError() = NetworkError<T>;
  const factory ClassicLeagueFailures.serverError() = ServerError<T>;
}
