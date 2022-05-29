import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_leagues_failures.freezed.dart';

@freezed
abstract class CustomLeaguesFailures<T> with _$CustomLeaguesFailures<T> {
  const factory CustomLeaguesFailures.invalidLeagueId(
      {required String leagueCode}) = InvalidLeagueCode<T>;

  const factory CustomLeaguesFailures.networkError() = NetworkError<T>;
  const factory CustomLeaguesFailures.serverError() = ServerError<T>;
}
