import 'package:efpl/domain/auth/auth_value_objects.dart';
import 'package:efpl/domain/auth/user.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_dtos.freezed.dart';
part 'auth_dtos.g.dart';

@freezed
abstract class UserDto implements _$UserDto {
  const UserDto._();
  // user entity data transfer object
  const factory UserDto({
    required String email,
    required String userName,
    required String teamName,
    required String country,
    required String favouriteEplTeam,
    required String token,
    @Default("") String password,
  }) = _UserDto;

  // from Domain to Dto
  factory UserDto.fromDomain(User user, {Password? password}) => UserDto(
        email: user.email.isValid() ? user.email.getOrCrash() : "",
        userName: user.userName.isValid() ? user.userName.getOrCrash() : "",
        teamName: user.teamName.isValid() ? user.teamName.getOrCrash() : "",
        country: user.country.isValid() ? user.country.getOrCrash() : "",
        token: user.token.isValid() ? user.token.getOrCrash() : "",
        favouriteEplTeam: user.favouriteEplTeam.isValid()
            ? user.favouriteEplTeam.getOrCrash()
            : "",
        password: password?.isValid() == true ? password!.getOrCrash() : "",
      );

  // to Domain from Dto
  User toDomain() {
    return User(
      email: EmailAddress(email),
      userName: UserName(userName),
      teamName: TeamName(teamName),
      country: Country(country),
      favouriteEplTeam: FavoriteEplTeam(favouriteEplTeam),
      token: Token(token),
    );
  }

  // json converter
  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
