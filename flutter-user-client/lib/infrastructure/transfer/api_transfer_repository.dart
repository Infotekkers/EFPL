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

    // remote id
    // const userID = "627970e3b106bad35b4dde88";

    // local id
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
      final parseResponseTeam = parsedResponseBody['team'][0];

      // if response has players
      if (parseResponseTeam['players'].length > 0) {
        List allPlayers = parseResponseTeam['players'];
        for (var i = 0; i < allPlayers.length; i++) {
          Map<String, dynamic> availability = {
            "injuryStatus": parseResponseTeam['players'][i]['availability']
                ['injuryStatus'],
            "injuryMessage": parseResponseTeam['players'][i]['availability']
                ['injuryMessage']
          };

          allPlayers[i]['availability'] = availability;

          final UserPlayerDTO userPlayerDTO =
              UserPlayerDTO.fromJson(allPlayers[i]);

          allUserPlayers.add(userPlayerDTO.toDomain());
        }

        // Team
        UserTeam userTeam = UserTeam(
          gameWeekId: GameWeekId(value: parseResponseTeam['gameweekId']),
          gameWeekDeadline: parsedResponseBody['gameWeekDeadline'].toString(),
          allUserPlayers: allUserPlayers,
          freeTransfers: parseResponseTeam['freeTransfers'],
          deduction: parseResponseTeam['deduction'],
          activeChip: parseResponseTeam['activeChip'],
          availableChips: parsedResponseBody['availableChips'],
          maxBudget: double.parse(
            parsedResponseBody['maxBudget'].toString(),
          ),
          teamName: parsedResponseBody['teamName'],
        );

        // get all teams with logo path
        var allTeamsApiResponse = await instance.client
            .get(
              Uri.parse('$_baseURL/teams/all'),
            )
            .timeout(
              const Duration(seconds: 30),
            );

        if (allTeamsApiResponse.statusCode == 200) {
          List<dynamic> parsedResponseBody =
              jsonDecode(allTeamsApiResponse.body);
          List allTeams = [];

          for (var i = 0; i < parsedResponseBody.length; i++) {
            Map currentTeam = {
              "teamName": parsedResponseBody[i]['teamName'],
              "teamLogo": parsedResponseBody[i]['teamLogo'],
            };
            allTeams.add(currentTeam);
          }

          try {
            var efplCache = await Hive.openBox('efplCache');
            efplCache.put("allTeams", allTeams);
          } catch (e) {
            print(e);
          }
        }

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
      List allPlayers = [];
      List<UserPlayer> allPlayersInPosition = [];
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
          Map availability = {"injuryStatus": "", "injuryMessage": ""};

          if (parsedResponseBody[i]['availability'] != null) {
            availability['injuryStatus'] =
                parsedResponseBody[i]['availability']['injuryStatus'];

            availability['injuryMessage'] =
                parsedResponseBody[i]['availability']['injuryMessage'];
          }

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
            availability: PlayerAvailability(value: availability),
            eplTeamLogo: parsedResponseBody[i]['eplTeamLogo'],
            score: parsedResponseBody[i]['score'] ?? 0,
          );

          String currentPlayerPosition = userPlayer.playerPosition.value.fold(
            (l) => '',
            (r) => r,
          );

          if (currentPlayerPosition == playerPosition) {
            allPlayersInPosition.add(userPlayer);
          }

          allPlayers.add(parsedResponseBody[i]);

          // add to cache
          try {
            var efplCache = await Hive.openBox('efplCache');
            efplCache.put("allPlayers", allPlayers);
          } catch (e) {
            print(e);
          }
        }
      }

      return right(allPlayersInPosition);
    } catch (e) {
      print(e);
      return left(
        const HTTPFailures.noConnection(failedValue: ""),
      );
    }
  }

  @override
  Future<Either<dynamic, bool>> saveUserPlayers(
      {required int gameWeekId, required UserTeam userTeam}) async {
    // TODO: implement saveUserPlayers

    const userID = "627a7798bed9e567269bb8a9";

    try {
      HTTPInstance instance = getIt<HTTPInstance>();

      var apiResponse = await instance.client.patch(
        Uri.parse('$_baseURL/user/team/$userID/$gameWeekId'),
        body: {
          "incomingTeam": jsonEncode(
            userTeamToJson(userTeam: userTeam),
          ),
        },
      ).timeout(
        const Duration(seconds: 30),
      );

      if (apiResponse.statusCode == 200) {
        return right(true);
      } else {
        return left(false);
      }
    } catch (e) {
      return left(false);
    }
  }
}

Map userTeamToJson({required UserTeam userTeam}) {
  Map userTeamJson = {};

  // set gameweek id
  userTeamJson['gameWeekId'] = userTeam.gameWeekId.value.fold(
    (l) => '',
    (r) => r,
  );

  // set free transfers
  userTeamJson['freeTransfers'] = userTeam.freeTransfers;

  // set deduction
  userTeamJson['deduction'] = userTeam.deduction;

  // set active chip
  userTeamJson['activeChip'] = userTeam.activeChip;

  List allPlayerIds = [];

  userTeam.allUserPlayers.forEach((player) {
    allPlayerIds.add(player.playerId);
  });

  userTeamJson['allPlayers'] = allPlayerIds;

  return userTeamJson;
}
