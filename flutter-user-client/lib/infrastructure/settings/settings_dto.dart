import 'package:efpl/domain/settings/settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:efpl/domain/settings/value_objects.dart';

part 'settings_dto.freezed.dart';
part 'settings_dto.g.dart';

@freezed
abstract class UserDetailDto implements _$UserDetailDto {
  const UserDetailDto._();
  // user entity data transfer object
  const factory UserDetailDto({
    required String teamName,
    required String favouriteEplTeam,
    required String userName,
  }) = _UserDetailDto;

  factory UserDetailDto.fromDomain(UserDetail userDetail) {
    return UserDetailDto(
      teamName: userDetail.teamName.isValid() ? userDetail.getOrCrash() : '',
      favouriteEplTeam:
          userDetail.favouriteEplTeam.isValid() ? userDetail.getOrCrash() : '',
      userName: userDetail.userName.isValid() ? userDetail.getOrCrash() : '',
    );
  }

  UserDetail toDomain() {
    return UserDetail(
      teamName: TeamName(teamName),
      favouriteEplTeam: FavouriteEplTeam(favouriteEplTeam),
      userName: UserName(userName),
    );
  }

  factory UserDetailDto.fromJson(Map<String, dynamic> json) =>
      _$UserDetailDtoFromJson(json);
}
