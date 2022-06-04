import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/core_value_objects.dart';
import 'package:efpl/domain/core/value_failures.dart';

import 'value_validators.dart';

class LeagueId extends ValueObject {
  @override
  final Either<ValueFailure<String>, int> value;

  factory LeagueId({required int value}) {
    return LeagueId._(value: validateLeagueId(leagueId: value));
  }

  const LeagueId._({required this.value});
}

class AdminId extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AdminId({required String value}) {
    return AdminId._(value: validateAdminId(adminId: value));
  }

  const AdminId._({required this.value});
}

class LeagueName extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory LeagueName({required String value}) {
    return LeagueName._(value: validateLeagueName(leagueName: value));
  }

  const LeagueName._({required this.value});
}

class LeagueType extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory LeagueType({required String value}) {
    return LeagueType._(value: validateLeagueType(leagueType: value));
  }

  const LeagueType._({required this.value});
}

class LeagueCode extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory LeagueCode({required String value}) {
    return LeagueCode._(value: validateLeagueCode(leagueCode: value));
  }

  const LeagueCode._({required this.value});
}

class LeagueStartGameWeek extends ValueObject {
  @override
  final Either<ValueFailure<String>, int> value;

  factory LeagueStartGameWeek({required int value}) {
    return LeagueStartGameWeek._(
        value: validateLeagueStartGameWeek(leagueStartGameWeek: value));
  }

  const LeagueStartGameWeek._({required this.value});
}

class PreviousRank extends ValueObject {
  @override
  final Either<ValueFailure<String>, int> value;

  factory PreviousRank({required int value}) {
    return PreviousRank._(value: validatePreviousRank(previousRank: value));
  }

  const PreviousRank._({required this.value});
}

class MemberId extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MemberId({required String value}) {
    return MemberId._(value: validateMemberId(memberId: value));
  }

  const MemberId._({required this.value});
}

class MemberTeamName extends ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MemberTeamName({required String value}) {
    return MemberTeamName._(
        value: validateMemberTeamName(memberTeamName: value));
  }

  const MemberTeamName._({required this.value});
}

class MemberPoints extends ValueObject {
  @override
  final Either<ValueFailure<String>, int> value;

  factory MemberPoints({required int value}) {
    return MemberPoints._(value: validateMemberPoints(memberPoints: value));
  }

  const MemberPoints._({required this.value});
}
