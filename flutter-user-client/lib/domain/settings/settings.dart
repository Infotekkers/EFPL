import 'package:efpl/domain/core/value_failures.dart';
import 'package:efpl/domain/points/points_failures.dart';
import 'package:efpl/domain/settings/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

@freezed
abstract class Settings with _$Settings {
  const factory Settings({
    required UserName userName,
    required TeamName teamName,
    required FavouriteEplTeam favouriteEplTeam,
  }) = _Settings;

  factory Settings.empty() => Settings(
        userName: UserName(''),
        teamName: TeamName(''),
        favouriteEplTeam: FavouriteEplTeam(''),
      );
}
