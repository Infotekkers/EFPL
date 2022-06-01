import 'package:efpl/domain/custom_leagues/custom_leagues.dart';
import 'package:efpl/domain/custom_leagues/value_objects.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_leagues_dto.freezed.dart';

part 'custom_leagues_dto.g.dart';

@freezed
abstract class CustomLeaguesDTO implements _$CustomLeaguesDTO {
  const CustomLeaguesDTO._();

  const factory CustomLeaguesDTO({
    required int leagueId,
    required String leagueName,
    required int previousRank,
  }) = _CustomLeaguesDTO;

  factory CustomLeaguesDTO.fromDomain({required CustomLeagues customLeague}) =>
      CustomLeaguesDTO(
        leagueId: customLeague.leagueId.getOrCrash(),
        leagueName: customLeague.leagueName.getOrCrash(),
        previousRank: customLeague.previousRank.getOrCrash(),
      );

  CustomLeagues toDomain() => CustomLeagues(
        leagueId: LeagueId(value: leagueId),
        leagueName: LeagueName(value: leagueName),
        previousRank: PreviousRank(value: previousRank),
      );

  factory CustomLeaguesDTO.fromJson(Map<String, dynamic> json) =>
      _$CustomLeaguesDTOFromJson(json);
}
