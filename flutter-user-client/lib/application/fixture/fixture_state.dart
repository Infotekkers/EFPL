part of 'fixture_bloc.dart';

@freezed
class FixtureState with _$FixtureState {
  const factory FixtureState({
    required List<Fixture> allFixtures,
    required int gameWeekId,
    required bool showErrorMessages,
    required bool isLoading,
    required Option<Either<FixtureFailures, List<Fixture>>>
        fixtureFailureOrSuccess,
    required Option<Either<ValueFailure, dynamic>> valueFailureOrSuccess,
  }) = _FixtureState;

  factory FixtureState.initial() => FixtureState(
        allFixtures: [],
        gameWeekId: 1,
        isLoading: false,
        showErrorMessages: false,
        fixtureFailureOrSuccess: none(),
        valueFailureOrSuccess: none(),
      );
}
