import 'package:efpl/domain/custom_leagues/custom_leagues.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_leagues_dto.freezed.dart';

part 'custom_leagues_dto.g.dart';

@freezed
abstract class CustomLeaguesDTO implements _$CustomLeaguesDTO {
  const CustomLeaguesDTO._();

  const factory CustomLeaguesDTO({
    required List userCustomLeagues,
  }) = _CustomLeaguesDTO;

  factory CustomLeaguesDTO.fromDomain({required CustomLeagues customLeague}) =>
      CustomLeaguesDTO(
        userCustomLeagues: customLeague.userCustomLeagues,
      );

  CustomLeagues toDomain() => CustomLeagues(
        userCustomLeagues: userCustomLeagues,
      );

  factory CustomLeaguesDTO.fromJson(Map<String, dynamic> json) =>
      _$CustomLeaguesDTOFromJson(json);
}
