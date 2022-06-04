import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/value_failures.dart';

Either<ValueFailure<String>, int> validateLeagueId({required int leagueId}) {
  return right(leagueId);
}

Either<ValueFailure<String>, String> validateAdminId(
    {required String adminId}) {
  return right(adminId);
}

Either<ValueFailure<String>, String> validateLeagueName(
    {required String leagueName}) {
  return right(leagueName);
}

Either<ValueFailure<String>, String> validateMemberId(
    {required String memberId}) {
  return right(memberId);
}

Either<ValueFailure<String>, String> validateMemberTeamName(
    {required String memberTeamName}) {
  return right(memberTeamName);
}

Either<ValueFailure<String>, int> validateMemberPoints(
    {required int memberPoints}) {
  return right(memberPoints);
}

Either<ValueFailure<String>, String> validateLeagueType(
    {required String leagueType}) {
  return right(leagueType);
}

Either<ValueFailure<String>, String> validateLeagueCode(
    {required String leagueCode}) {
  return right(leagueCode);
}

Either<ValueFailure<String>, int> validateLeagueStartGameWeek(
    {required int leagueStartGameWeek}) {
  return right(leagueStartGameWeek);
}

Either<ValueFailure<String>, int> validatePreviousRank(
    {required int previousRank}) {
  return right(previousRank);
}

Either<ValueFailure<String>, List<dynamic>> validateCustomLeagueMembers(
    {required List<dynamic> members}) {
  return right(members);
}
