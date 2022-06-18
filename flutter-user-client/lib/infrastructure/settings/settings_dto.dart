import 'package:efpl/domain/settings/settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:efpl/domain/settings/value_objects.dart';

part 'settings_dto.freezed.dart';
part 'settings_dto.g.dart';

@freezed
abstract class SettingsDto implements _$SettingsDto {
  const SettingsDto._();
  // user entity data transfer object
  const factory SettingsDto({
    required String teamName,
    required String favouriteEplTeam,
    required String userName,
  }) = _SettingsDto;

  factory SettingsDto.fromDomain(Settings settings) {
    return SettingsDto(
      teamName: settings.teamName.getOrCrash(),
      favouriteEplTeam: settings.favouriteEplTeam.getOrCrash(),
      userName: settings.userName.getOrCrash(),
    );
  }

  Settings toDomain() {
    return Settings(
      teamName: TeamName(teamName),
      favouriteEplTeam: FavouriteEplTeam(favouriteEplTeam),
      userName: UserName(userName),
    );
  }

  factory SettingsDto.fromJson(Map<String, dynamic> json) =>
      _$SettingsDtoFromJson(json);
}
