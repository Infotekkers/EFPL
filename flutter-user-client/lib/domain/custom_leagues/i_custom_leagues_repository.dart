import 'package:dartz/dartz.dart';

abstract class ICustomLeaguesRepository {
  Future<Either<dynamic, List>> getUserCustomLeagues({
    required String userId,
  });
}
