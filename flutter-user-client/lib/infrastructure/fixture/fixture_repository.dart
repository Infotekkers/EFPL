// ignore_for_file: unused_field

import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/fixture/fixture.dart';
import 'package:efpl/domain/fixture/i_fixture_facade.dart';
import 'package:efpl/infrastructure/fixture/fixture_local_data_provider.dart';
import 'package:efpl/infrastructure/fixture/fixture_remote_data_provider.dart';
import 'package:efpl/services/utility.dart';

class ApiFixtureRepository implements IFixtureRepository {
  Utility utility = Utility();

  final FixtureRemoteDataProvider _fixtureRemoteDataProvider =
      FixtureRemoteDataProvider();

  final FixtureLocalDataProvider _fixtureLocalDataProvider =
      FixtureLocalDataProvider();

  @override
  Future<Either<dynamic, List<Fixture>>> getFixtureByGameWeekId(
      {required int gameWeekId}) async {
    // if (await utility.hasInternetConnection()) {
    return _fixtureRemoteDataProvider.getFixtureByGameWeekId(
        gameWeekId: gameWeekId);
    // } else {
    //   return _fixtureLocalDataProvider.getFixtureByGameWeekId(
    //     gameWeekId: gameWeekId,
    //   );
    // }
  }
}
