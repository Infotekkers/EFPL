import 'package:efpl/domain/auth/auth_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    // required UniqueId id,
    required EmailAddress emailAddress,
    required UserName userName,
    required TeamName teamName,
    required Country country,
    required FavoriteEplTeam favoriteEplTeam,
  }) = _User;

  factory User.initial() => User(
        // id: UniqueId(),
        emailAddress: EmailAddress(""),
        userName: UserName(""),
        teamName: TeamName(""),
        country: Country(""),
        favoriteEplTeam: FavoriteEplTeam(""),
      );
}
