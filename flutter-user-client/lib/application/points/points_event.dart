part of 'points_bloc.dart';

@freezed
class PointsEvent with _$PointsEvent {
  const factory PointsEvent.getPointsInfo() = _getPointsInfo;

  const factory PointsEvent.increaseGameWeek() = _increaseGameWeek;

  const factory PointsEvent.decreaseGameWeek() = _decreaseGameWeek;
}
