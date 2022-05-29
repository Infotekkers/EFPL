import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_leagues.freezed.dart';

@freezed
abstract class CustomLeagues with _$CustomLeagues {
  const factory CustomLeagues({
    required List userCustomLeagues,
  }) = _CustomLeagues;

  factory CustomLeagues.initial() => const CustomLeagues(
        userCustomLeagues: [],
      );
}
