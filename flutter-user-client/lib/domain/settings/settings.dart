import 'package:efpl/domain/settings/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

@freezed
abstract class UserDetail with _$UserDetail {
  const factory UserDetail({
    required UserName userName,
    required TeamName teamName,
    required FavouriteEplTeam favouriteEplTeam,
  }) = _UserDetail;
}
