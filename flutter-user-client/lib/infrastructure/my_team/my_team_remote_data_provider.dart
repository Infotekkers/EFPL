import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:efpl/domain/my_team/my_team.dart';
import 'package:efpl/domain/my_team/my_team_failures.dart';
import 'package:efpl/infrastructure/my_team/my_team_dto.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@injectable
class MyTeamRemoteDataProvider {
  HTTPInstance instance = getIt<HTTPInstance>();

  static final String _baseUrl = "${dotenv.env["API"]}";

  MyTeamRemoteDataProvider();

  Future<Either<MyTeamFailure, MyTeam>> getUserTeam(String gameweekId) async {
    final Uri url = Uri.parse("$_baseUrl/user/fetchUserTeam/$gameweekId");

    try {
      final response = await instance.client.get(url);

      if (response.statusCode == 200) {
        MyTeamDto myTeamDto = MyTeamDto.fromJson(jsonDecode(response.body));

        myTeamDto = classifyPlayers(myTeamDto);

        return right(myTeamDto.toDomain());
      } else if (response.statusCode == 403) {
        return left(const MyTeamFailure.authError());
      }

      return left(const MyTeamFailure.serverError());
    } catch (e) {
      return left(const MyTeamFailure.networkError());
    }
  }

  Future<Either<MyTeamFailure, Unit>> saveUserTeam(MyTeam myTeam) async {
    final Uri url = Uri.parse("$_baseUrl/user/transfer");

    MyTeamDto myTeamDto = MyTeamDto.fromDomain(myTeam);
    myTeamDto = declassifyPlayers(myTeamDto);

    final outgoingJson = jsonEncode({
      "data": {
        "incomingTeam": myTeamDto.toJson(),
        "isSetTeam": true,
      }
    });

    try {
      final response = await instance.client.put(url,
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
    Map<String, Map<String, dynamic>> playersOrganizedByPosition = {
      'gk': {},
      'def': {},
      'mid': {},
      'att': {},
      'sub': {},
    };

    for (String playerId in myTeamDto.players.keys) {
      myTeamDto.players[playerId]['position'] =
          myTeamDto.players[playerId]['position'].toString().toLowerCase();

      if (myTeamDto.players[playerId].containsKey('position') &&
          myTeamDto.players[playerId]['multiplier'] > 0) {
        final position = myTeamDto.players[playerId]['position'];

        playersOrganizedByPosition[position]![playerId] =
            myTeamDto.players[playerId];
      } else if (myTeamDto.players[playerId].containsKey('position') &&
          myTeamDto.players[playerId]['multiplier'] == 0) {
        playersOrganizedByPosition['sub']![playerId] =
            myTeamDto.players[playerId];
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
