import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/my_team/my_team.dart';
import 'package:efpl/domain/my_team/my_team_failures.dart';
import 'package:efpl/infrastructure/my_team/my_team_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MyTeamRemoteDataProvider {
  http.Client? client = http.Client();

  static final String _baseUrl = "${dotenv.env["API"]}";

  MyTeamRemoteDataProvider();

  Future<Either<MyTeamFailure, MyTeam>> getUserTeam(
      String userId, String gameweekId) async {
    final Uri url =
        Uri.parse("$_baseUrl/user/fetchUserTeam/$userId/$gameweekId");

    try {
      final response = await client!.get(url);

      if (response.statusCode == 200) {
        MyTeamDto myTeamDto = MyTeamDto.fromJson(jsonDecode(response.body));

        myTeamDto = classifyPlayers(myTeamDto);

        return right(myTeamDto.toDomain());
      }

      return left(const MyTeamFailure.serverError());
    } catch (e) {
      return left(const MyTeamFailure.networkError());
    }
  }

  Future<Either<MyTeamFailure, Unit>> saveUserTeam(
      MyTeam myTeam, String userId) async {
    final Uri url = Uri.parse("$_baseUrl/user/transfer");

    MyTeamDto myTeamDto = MyTeamDto.fromDomain(myTeam);
    myTeamDto = declassifyPlayers(myTeamDto);

    final outgoingJson = jsonEncode({
      "userId": userId,
      "incomingTeam": myTeamDto.toJson(),
    });

    try {
      final response = await client!.put(url,
          body: outgoingJson, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        return right(unit);
      }
      return left(const MyTeamFailure.serverError());
    } catch (e) {
      return left(const MyTeamFailure.networkError());
    }
  }

  MyTeamDto classifyPlayers(MyTeamDto myTeamDto) {
    Map<String, List> playersOrganizedByPosition = {
      'gk': [],
      'def': [],
      'mid': [],
      'att': [],
      'sub': [],
    };

    for (String playerId in myTeamDto.players.keys) {
      if (myTeamDto.players[playerId].containsKey('position') &&
          myTeamDto.players[playerId]['multiplier'] > 0) {
        final position =
            myTeamDto.players[playerId]['position'].toString().toLowerCase();

        playersOrganizedByPosition[position]?.add(myTeamDto.players[playerId]);
      } else if (myTeamDto.players[playerId].containsKey('position') &&
          myTeamDto.players[playerId]['multiplier'] == 0) {
        playersOrganizedByPosition['sub']?.add(myTeamDto.players[playerId]);
      }
    }

    return myTeamDto.copyWith(players: playersOrganizedByPosition);
  }

  MyTeamDto declassifyPlayers(MyTeamDto myTeamDto) {
    Map<String, dynamic> mixedPlayers = {};

    for (String position in myTeamDto.players.keys) {
      for (String playerId in myTeamDto.players[position].keys) {
        mixedPlayers[playerId] = myTeamDto.players[position][playerId];
      }
    }

    return myTeamDto.copyWith(players: mixedPlayers);
  }
}
