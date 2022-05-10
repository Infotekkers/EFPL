import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/http_failures.dart';
import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:efpl/domain/transfer/i_user_players_facade.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:efpl/infrastructure/transfer/user_player_dto.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';

class ApiTransferRepository implements ITransferRepository {
  final String _baseURL = dotenv.env["BASE_URL"].toString();

  @override
  Future<Either<dynamic, UserTeam>> getUserPlayers(
      {required int gameWeekId}) async {
    // TODO:Replace
    // const userID = "6278d568abfa93c09603628a";
    const userID = "627a7798bed9e567269bb8a9";

    HTTPInstance instance = getIt<HTTPInstance>();
    var apiResponse = await instance.client
        .get(
          Uri.parse('$_baseURL/user/team/$userID/$gameWeekId'),
        )
        .timeout(
          const Duration(seconds: 30),
        );

    if (apiResponse.statusCode == 200) {
      List<UserPlayer> allUserPlayers = [];
      final parsedResponseBody = jsonDecode(apiResponse.body);

      // if response has players
      if (parsedResponseBody['players'].length > 0) {
        List allPlayers = parsedResponseBody['players'];
        for (var i = 0; i < allPlayers.length; i++) {
          final UserPlayerDTO userPlayerDTO =
              UserPlayerDTO.fromJson(allPlayers[i]);

          allUserPlayers.add(userPlayerDTO.toDomain());
        }

        // Team
        UserTeam userTeam = UserTeam(
          gameWeekId: GameWeekId(value: parsedResponseBody['gameweekId']),
          allUserPlayers: allUserPlayers,
          freeTransfers: parsedResponseBody['freeTransfers'],
          deduction: parsedResponseBody['deduction'],
          activeChip: parsedResponseBody['activeChip'],
        );

        return right(userTeam);
      } else {}
    }

    return left(
      const HTTPFailures.unauthenticated(failedValue: "Please Login!"),
    );
  }

  @override
  Future<Either<dynamic, List<UserPlayer>>> getAllPositionPlayers(
      {required String playerPosition}) async {
    HTTPInstance instance = getIt<HTTPInstance>();
    try {
      List<UserPlayer> allPlayers = [];
      var apiResponse = await instance.client
          .get(
            Uri.parse('$_baseURL/players/position/$playerPosition'),
          )
          .timeout(
            const Duration(seconds: 30),
          );

      if (apiResponse.statusCode == 200) {
        List<dynamic> parsedResponseBody = jsonDecode(apiResponse.body);

        for (var i = 0; i < parsedResponseBody.length; i++) {
          UserPlayer userPlayer = UserPlayer(
            playerId: (parsedResponseBody[i]['playerId']).toString(),
            playerName: PlayerName(
              value: parsedResponseBody[i]['playerName'],
            ),
            currentPrice: PlayerPrice(
              value: parsedResponseBody[i]['currentPrice'].toDouble(),
            ),
            playerPosition: PlayerPosition(
              value: parsedResponseBody[i]['position'],
            ),
            eplTeamId: PlayerEplTeam(
              value: parsedResponseBody[i]['eplTeamId'],
            ),
            multiplier: 1,
            isCaptain: false,
            isViceCaptain: false,
          );

          allPlayers.add(userPlayer);

          // add to cache
          try {
            var efplCache = await Hive.openBox('efplCache');
            List? cachedPlayers = efplCache.get("players");

            // if (cachedPlayers!.isNotEmpty) {
            //   efplCache.put("players", allPlayers);
            // }
          } catch (e) {
            print(e);
          }
        }
      }
      return right(allPlayers);
    } catch (e) {
      print(e);
      return left(
        const HTTPFailures.noConnection(failedValue: ""),
      );
    }
  }

  @override
  Future<Either<dynamic, List<UserPlayer>>> saveUserPlayers(
      {required int gameWeekId}) {
    // TODO: implement saveUserPlayers
    throw UnimplementedError();
  }
}
