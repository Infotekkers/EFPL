import 'package:efpl/domain/auth/auth_value_objects.dart';
import 'package:efpl/domain/auth/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_dtos.freezed.dart';
part 'auth_dtos.g.dart';

@freezed
abstract class UserDto implements _$UserDto {
  const UserDto._();
  // user entity data transfer object
  const factory UserDto({
    required String email,
    // required String userName,
    // required String teamName,
    // required String country,
    // required String favoriteEplTeam,
    @Default("") String password,
  }) = _UserDto;

  // from Domain to Dto
  factory UserDto.fromDomain(User user, {Password? password}) => UserDto(
        email: user.email.isValid() ? user.email.getOrCrash() : "",
        // userName: user.userName.getOrCrash(),
        // teamName: user.teamName.getOrCrash(),
        // country: user.country.getOrCrash(),
        // favoriteEplTeam: user.favoriteEplTeam.getOrCrash(),
        password: password?.isValid() == true ? password!.getOrCrash() : "",
      );

  // to Domain from Dto
  User toDomain() {
    return User(
      email: EmailAddress(email),
      // userName: UserName(userName),
      // teamName: TeamName(teamName),
      // country: Country(country),
      // favoriteEplTeam: FavoriteEplTeam(favoriteEplTeam),
    );
  }

  // json converter
  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
