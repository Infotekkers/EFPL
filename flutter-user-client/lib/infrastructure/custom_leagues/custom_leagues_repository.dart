import 'package:dartz/dartz.dart';
import 'package:efpl/domain/custom_leagues/i_custom_leagues_repository.dart';
import 'package:efpl/infrastructure/custom_leagues/custom_leagues_remote_data_provider.dart';

class ApiCustomLeaguesRepository implements ICustomLeaguesRepository {
  final CustomLeaguesRemoteDataProvider _customLeaguesRemoteDataProvider =
      CustomLeaguesRemoteDataProvider();

  @override
  Future<Either<dynamic, List>> getUserCustomLeagues({
    required String userId,
  }) async {
    return _customLeaguesRemoteDataProvider.getUserCustomLeagues(
      userId: userId,
    );
  }
}
