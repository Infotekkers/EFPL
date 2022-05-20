import 'package:efpl/domain/auth/auth_value_objects.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required Token token,
    required EmailAddress email,
    required UserName userName,
    required TeamName teamName,
    required Country country,
    required FavoriteEplTeam favouriteEplTeam,
  }) = _User;

  factory User.initial() => User(
        token: Token(""),
        email: EmailAddress(""),
        userName: UserName(""),
        teamName: TeamName(""),
        country: Country(""),
        favouriteEplTeam: FavoriteEplTeam(""),
      );
}
