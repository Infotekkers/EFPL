import 'package:dartz/dartz.dart';
import 'package:efpl/domain/my_team/my_team.dart';
import 'package:efpl/domain/my_team/my_team_failures.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MyTeamRemoteDataProvider {
  http.Client? client = http.Client();

  static final String _baseUrl = "${dotenv.env["API"]}";

  MyTeamRemoteDataProvider();

  Future<Either<MyTeamFailure, MyTeam>> getUserTeam(String userId) async {
    final Uri url = Uri.parse("$_baseUrl/user/fetchOne/$userId");

    try {
      final response = await client!.get(url);

      return left(const MyTeamFailure.networkError());
    } catch (e) {
      return left(const MyTeamFailure.networkError());
    }
  }

  Future<Either<MyTeamFailure, Unit>> saveUserTeam(
      MyTeam myTeam, String userId) {
    // TODO: implement saveUserTeam
    throw UnimplementedError();
  }
}
