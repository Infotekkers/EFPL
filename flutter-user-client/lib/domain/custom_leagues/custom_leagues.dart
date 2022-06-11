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

@freezed
abstract class CustomLeaguesInfo with _$CustomLeaguesInfo {
  const factory CustomLeaguesInfo({
    required LeagueId leagueId,
    required LeagueName leagueName,
    required LeagueType leagueType,
    required LeagueCode leagueCode,
    required AdminId adminId,
    required CustomLeagueMembers customLeagueMembers,
    required LeagueStartGameWeek leagueStartGameWeek,
  }) = _CustomLeaguesInfo;
}

@freezed
abstract class CustomLeagueMember with _$CustomLeagueMember {
  const factory CustomLeagueMember({
    required MemberId memberId,
    required MemberTeamName memberTeamName,
    required MemberPoints memberPoints,
  }) = _CustomLeagueMember;
}
