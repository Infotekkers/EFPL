part of 'fixture_bloc.dart';

@freezed
class FixtureEvent with _$FixtureEvent {
  const factory FixtureEvent.started() = _Started;
}