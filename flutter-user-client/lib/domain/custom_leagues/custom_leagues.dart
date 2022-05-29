import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_leagues.freezed.dart';

@freezed
abstract class UserCustomLeague with _$UserCustomLeague {
  const factory UserCustomLeague({
    required List userCustomLeagues,
  }) = _UserCustomLeague;

  factory UserCustomLeague.initial() => const UserCustomLeague(
        userCustomLeagues: [],
      );
}
