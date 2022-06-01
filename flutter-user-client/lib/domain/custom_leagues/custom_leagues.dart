import 'package:efpl/domain/custom_leagues/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_leagues.freezed.dart';

@freezed
abstract class CustomLeagues with _$CustomLeagues {
  const factory CustomLeagues({
    required LeagueId leagueId,
    required LeagueName leagueName,
    required PreviousRank previousRank,
  }) = _CustomLeagues;
}
