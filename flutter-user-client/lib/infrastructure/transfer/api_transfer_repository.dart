import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/http_failures.dart';
import 'package:efpl/domain/core/storage_failures.dart';
import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:efpl/domain/transfer/i_user_players_facade.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_players_failures.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:efpl/infrastructure/transfer/user_player_dto.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/services/constants.dart';
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

    try {
      HTTPInstance instance = getIt<HTTPInstance>();
      var apiResponse = await instance.client
          .get(
            Uri.parse('$_baseURL/user/team/$userID/$gameWeekId'),
          )
          .timeout(
            Duration(seconds: ConstantValues().httpTimeOutDuration),
          );

      if (apiResponse.statusCode == 200) {
        List<UserPlayer> allUserPlayers = [];
        List<dynamic> allUserPlayersJson = [];

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
            allUserPlayersJson.add(allPlayers[i]);
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

          Map userTeamJson = {
            "gameWeekId": parseResponseTeam['gameweekId'],
            "gameWeekDeadline":
                parsedResponseBody['gameWeekDeadline'].toString(),
            "allUserPlayers": allUserPlayersJson,
            "freeTransfers": parseResponseTeam['freeTransfers'],
            "deduction": parseResponseTeam['deduction'],
            "activeChip": parseResponseTeam['activeChip'],
            "availableChips": parsedResponseBody['availableChips'],
            "maxBudget": double.parse(
              parsedResponseBody['maxBudget'].toString(),
            ),
            "teamName": parsedResponseBody['teamName'],
          };

          // ADD to cache
          try {
            var efplCache = await Hive.openBox('efplCache');
            efplCache.put("userTeam", userTeamJson);
          } catch (e) {
            print(e);
          }

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
              return left(
                const StorageFailures.hiveError(
                    failedValue: "Error Caching Info"),
              );
            }
          }

          return right(userTeam);
        }
        // if response has no players
        else {
          // TODO: CHECK CACHE
          return left(
            const UserPlayerFailure.incompleteTeam(
                failedValue: "No Team. Please select a team."),
          );
        }
      }

      // No Token
      else if (apiResponse.statusCode == 403) {
        return left(
          const HTTPFailures.unauthenticated(
            failedValue: "Please Login!",
          ),
        );
      }

      // incorrect token
      else if (apiResponse.statusCode == 401) {
        return left(
          const HTTPFailures.unauthorized(
            failedValue: "Invalid Token.",
          ),
        );
      }

      // unexpected error
      else {
        // TODO:GET CACHED INFO
        return left(
          const HTTPFailures.unexpectedError(
              failedValue: "Something went wrong. Try again!"),
        );
      }
    }

    // Timeout Exception
    on TimeoutException catch (_) {
      // get cache team
      UserTeam cachedUserTeam =
          await getUserTeamFromCache(gameWeekId: gameWeekId);

      return left(
        [
          cachedUserTeam,
          const HTTPFailures.noConnection(
              failedValue: "Could not connect to server. Try refreshing.")
        ],
      );
    }
    // Socket Exception
    on SocketException catch (_) {
      // get cache team
      UserTeam cachedUserTeam =
          await getUserTeamFromCache(gameWeekId: gameWeekId);

      return left(
        [
          cachedUserTeam,
          const HTTPFailures.socketError(
              failedValue: "Could not connect to server. Try refreshing."),
        ],
      );
    }

    // Handshake error
    on HandshakeException catch (_) {
      // get cache team
      UserTeam cachedUserTeam =
          await getUserTeamFromCache(gameWeekId: gameWeekId);

      return left(
        [
          cachedUserTeam,
          const HTTPFailures.handShakeError(
              failedValue: "Could not connect to server. Try refreshing."),
        ],
      );
    }
    // unexpected error
    catch (e) {
      // get cache team
      UserTeam cachedUserTeam =
          await getUserTeamFromCache(gameWeekId: gameWeekId);

      return left(
        [
          cachedUserTeam,
          const HTTPFailures.unexpectedError(
              failedValue: "Something went wrong. Try again!"),
        ],
      );
    }
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

Future<UserTeam> getUserTeamFromCache({required int gameWeekId}) async {
  var efplCache = await Hive.openBox('efplCache');
  dynamic allUserPlayers = efplCache.get("userTeam");

  if (allUserPlayers['gameWeekId'] == gameWeekId) {
    List allUserPlayerJson = allUserPlayers['allUserPlayers'];
    List<UserPlayer> allUserPlayersDomain = [];
    for (var player in allUserPlayerJson) {
      final currentPlayerMap = {
        "playerId": player['playerId'],
        "multiplier": player['multiplier'],
        "isCaptain": player['isCaptain'],
        "isViceCaptain": player['isViceCaptain'],
        "playerName": player['playerName'],
        "eplTeamId": player['eplTeamId'],
        "eplTeamLogo": player['eplTeamLogo'],
        "currentPrice": player['currentPrice'],
        "position": player['position'],
        "availability": {
          "injuryStatus": player['availability']['injuryStatus'],
          "injuryMessage": player['availability']['injuryMessage'],
        },
        "score": player['score']
      };

      final UserPlayerDTO userPlayerDTO =
          UserPlayerDTO.fromJson(currentPlayerMap);

      allUserPlayersDomain.add(userPlayerDTO.toDomain());
    }

    UserTeam userTeam = UserTeam(
      gameWeekId: GameWeekId(value: allUserPlayers['gameWeekId']),
      gameWeekDeadline: allUserPlayers['gameWeekDeadline'].toString(),
      allUserPlayers: allUserPlayersDomain,
      freeTransfers: allUserPlayers['freeTransfers'],
      deduction: allUserPlayers['deduction'],
      activeChip: allUserPlayers['activeChip'],
      availableChips: allUserPlayers['availableChips'],
      maxBudget: double.parse(
        allUserPlayers['maxBudget'].toString(),
      ),
      teamName: allUserPlayers['teamName'],
    );

    return userTeam;
  } else {
    return UserTeam(
      gameWeekId: GameWeekId(value: 1),
      gameWeekDeadline: "",
      allUserPlayers: [],
      freeTransfers: 0,
      deduction: 0,
      activeChip: "",
      availableChips: [],
      maxBudget: 0,
      teamName: "",
    );
  }
}
