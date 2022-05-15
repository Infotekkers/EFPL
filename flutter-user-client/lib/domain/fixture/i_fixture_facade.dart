import 'package:dartz/dartz.dart';
import 'package:efpl/domain/fixture/fixture.dart';

abstract class IFixtureRepository {
  Future<Either<dynamic, List<Fixture>>> getFixtureByGameWeekId({
    required int gameWeekId,
  });
}
