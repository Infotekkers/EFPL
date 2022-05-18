import 'package:efpl/domain/auth/auth_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    // required UniqueId id,
    required EmailAddress email,
    required UserName userName,
    required TeamName teamName,
    required Country country,
    required FavoriteEplTeam favoriteEplTeamId,
  }) = _User;

  factory User.initial() => User(
        // id: UniqueId(),
        email: EmailAddress(""),
        userName: UserName(""),
        teamName: TeamName(""),
        country: Country(""),
        favoriteEplTeamId: FavoriteEplTeam(""),
      );
}
