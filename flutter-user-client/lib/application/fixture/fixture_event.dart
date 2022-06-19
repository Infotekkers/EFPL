part of 'fixture_bloc.dart';

@freezed
class FixtureEvent with _$FixtureEvent {
  const factory FixtureEvent.loadFixtures() = _loadFixtures;

  const factory FixtureEvent.increaseGameWeek() = _increaseGameWeek;

  const factory FixtureEvent.decreaseGameWeek() = _decreaseGameWeek;

  const factory FixtureEvent.fixtureChanged() = _fixtureChanged;
}
