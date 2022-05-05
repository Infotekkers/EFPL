import 'package:dartz/dartz.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/domain/fixture/fixture_failures.dart';

abstract class IFixtureRepository {
  Future<Either<FixtureFailures, List<Fixture>>> getFixtureByGameWeekId({
    required int gameWeekId,
  });
}
