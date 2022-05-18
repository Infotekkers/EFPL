import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/core/http_failures.dart';
import 'package:efpl/domain/fixture/value_objects.dart';
import 'package:efpl/domain/transfer/transfer_failures.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:efpl/infrastructure/transfer/transfer_local_data_provider.dart';
import 'package:efpl/infrastructure/transfer/transfer_repository.dart';
import 'package:efpl/infrastructure/transfer/user_player_dto.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/services/constants.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';

class TransferRemoteDataProvider {
  HTTPInstance instance = getIt<HTTPInstance>();

  final String _baseURL = dotenv.env["BASE_URL"].toString();

  TransferRemoteDataProvider();

  final TransferLocalDataProvider _transferLocalDataProvider =
      TransferLocalDataProvider();

  Future<Either<dynamic, List<UserPlayer>>> getAllPositionPlayers(
      {required String playerPosition}) async {
    try {
      List allPlayers = [];
      List<UserPlayer> allPlayersInPosition = [];
      var apiResponse = await instance.client
          .get(
            Uri.parse('$_baseURL/players/position/$playerPosition'),
          )
          .timeout(
            Duration(seconds: ConstantValues().httpTimeOutDuration),
          );

      // success scenario
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
            upComingFixtures: parsedResponseBody[i]['upComingFixtures'] ?? [],
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
          _transferLocalDataProvider.saveAllPlayersInPosition(
            allPlayersInPosition: allPlayers,
            playersPosition: playerPosition,
          );
        }
        return right(allPlayersInPosition);
      }

      // No Token
      else if (apiResponse.statusCode == 403) {
        return left(
          [
            [],
            const TransferFailure.unauthenticated(
              failedValue: "Please Login!",
            ),
          ],
        );
      }

      // No Token
      else if (apiResponse.statusCode == 401) {
        return left(
          [
            [],
            const TransferFailure.unauthorized(
              failedValue: "Please Login!",
            ),
          ],
        );
      }

      //
      else {
        return left(
          [
            [],
            const TransferFailure.unexpectedError(
              failedValue: "Something went wrong",
            ),
          ],
        );
      }
    }
    // Timeout Exception
    on TimeoutException catch (_) {
      Either<dynamic, List<UserPlayer>> cacheCall =
          await _transferLocalDataProvider.getAllPlayersInPosition(
              playerPosition: playerPosition);

      List<UserPlayer> cachedPlayers = cacheCall.fold(
        (l) => l[0],
        (r) => r,
      );
      return left(
        [
          cachedPlayers,
          const TransferFailure.noConnection(
              failedValue: "Could not connect to server. Try refreshing.")
        ],
      );
    }

    // Socket Exception
    on SocketException catch (_) {
      Either<dynamic, List<UserPlayer>> cacheCall =
          await _transferLocalDataProvider.getAllPlayersInPosition(
              playerPosition: playerPosition);

      List<UserPlayer> cachedPlayers = cacheCall.fold(
        (l) => l[0],
        (r) => r,
      );
      return left(
        [
          cachedPlayers,
          const TransferFailure.socketError(
              failedValue: "Could not connect to server. Try refreshing."),
        ],
      );
    }

    // Handshake error
    on HandshakeException catch (_) {
      Either<dynamic, List<UserPlayer>> cacheCall =
          await _transferLocalDataProvider.getAllPlayersInPosition(
              playerPosition: playerPosition);

      List<UserPlayer> cachedPlayers = cacheCall.fold(
        (l) => l[0],
        (r) => r,
      );
      return left(
        [
          cachedPlayers,
          const TransferFailure.handShakeError(
              failedValue: "Could not connect to server. Try refreshing."),
        ],
      );
    }

    // unexpected error
    catch (e) {
      print(e);
      Either<dynamic, List<UserPlayer>> cacheCall =
          await _transferLocalDataProvider.getAllPlayersInPosition(
              playerPosition: playerPosition);

      List<UserPlayer> cachedPlayers = cacheCall.fold(
        (l) => l[0],
        (r) => r,
      );
      return left(
        [
          cachedPlayers,
          const TransferFailure.unexpectedError(
              failedValue: "Something went wrong. Try again!"),
        ],
      );
    }
  }

  //  get user team from server
  Future<Either<dynamic, UserTeam>> getUserPlayers() async {
    try {
      // make api call
      var apiResponse = await instance.client
          .get(
            Uri.parse('$_baseURL/user/team'),
          )
          .timeout(
            Duration(seconds: ConstantValues().httpTimeOutDuration),
          );

      // success
      if (apiResponse.statusCode == 200) {
        List<UserPlayer> allUserPlayers = [];
        List<dynamic> allUserPlayersJson = [];

        final parsedResponseBody = jsonDecode(apiResponse.body);
        final parseResponseTeam = parsedResponseBody['team'];

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
          _transferLocalDataProvider.saveUserTeam(userTeam: userTeamJson);

          // get all teams with logo path
          var allTeamsApiResponse = await instance.client
              .get(
                Uri.parse('$_baseURL/teams/all'),
              )
              .timeout(
                Duration(seconds: ConstantValues().httpTimeOutDuration),
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

            // Add to cache
            _transferLocalDataProvider.saveAllTeamsAndLogo(allTeams: allTeams);
          }

          return right(userTeam);
        }
        // if response has no players
        else {
          Either<dynamic, UserTeam> cacheCall =
              await _transferLocalDataProvider.getUserTeam();
          UserTeam cachedUserTeam = cacheCall.fold(
            (l) => l[0],
            (r) => r,
          );
          return left([
            cachedUserTeam,
            const TransferFailure.incompleteTeam(
                failedValue: "No Team. Please select a team.")
          ]);
        }
      }

      // no user team
      else if (apiResponse.statusCode == 404) {
        return left([
          UserTeam(
            gameWeekId: GameWeekId(value: 1),
            gameWeekDeadline: "",
            allUserPlayers: [],
            freeTransfers: 0,
            deduction: 0,
            activeChip: "",
            availableChips: [],
            maxBudget: 0,
            teamName: "",
          ),
          const TransferFailure.noTeamSelected(
            failedValue: "No Initial Team",
          ),
        ]);
      }

      // No Token
      else if (apiResponse.statusCode == 403) {
        return left([
          UserTeam(
            gameWeekId: GameWeekId(value: 1),
            gameWeekDeadline: "",
            allUserPlayers: [],
            freeTransfers: 0,
            deduction: 0,
            activeChip: "",
            availableChips: [],
            maxBudget: 0,
            teamName: "",
          ),
          const TransferFailure.unauthenticated(
            failedValue: "Please Login!",
          ),
        ]);
      }

      // incorrect token
      else if (apiResponse.statusCode == 401) {
        return left(
          [
            UserTeam(
              gameWeekId: GameWeekId(value: 1),
              gameWeekDeadline: "",
              allUserPlayers: [],
              freeTransfers: 0,
              deduction: 0,
              activeChip: "",
              availableChips: [],
              maxBudget: 0,
              teamName: "",
            ),
            const TransferFailure.unauthorized(
              failedValue: "Invalid Token.",
            ),
          ],
        );
      }

      // unexpected error
      else {
        return left([
          UserTeam(
            gameWeekId: GameWeekId(value: 1),
            gameWeekDeadline: "",
            allUserPlayers: [],
            freeTransfers: 0,
            deduction: 0,
            activeChip: "",
            availableChips: [],
            maxBudget: 0,
            teamName: "",
          ),
          const TransferFailure.unexpectedError(
              failedValue: "Something went wrong. Try again!")
        ]);
      }
    }
    // Timeout Exception
    on TimeoutException catch (_) {
      // get cache team
      Either<dynamic, UserTeam> cacheCall =
          await _transferLocalDataProvider.getUserTeam();
      UserTeam cachedUserTeam = cacheCall.fold(
        (l) => l[0],
        (r) => r,
      );

      // print(cacheCall);

      return left(
        [
          cachedUserTeam,
          const TransferFailure.noConnection(
              failedValue: "Could not connect to server. Try refreshing.")
        ],
      );
    }
    // Socket Exception
    on SocketException catch (_) {
      // get cache team
      Either<dynamic, UserTeam> cacheCall =
          await _transferLocalDataProvider.getUserTeam();
      UserTeam cachedUserTeam = cacheCall.fold(
        (l) => l[0],
        (r) => r,
      );
      return left(
        [
          cachedUserTeam,
          const TransferFailure.socketError(
              failedValue: "Could not connect to server. Try refreshing."),
        ],
      );
    }

    // Handshake error
    on HandshakeException catch (_) {
      // get cache team
      Either<dynamic, UserTeam> cacheCall =
          await _transferLocalDataProvider.getUserTeam();
      UserTeam cachedUserTeam = cacheCall.fold(
        (l) => l[0],
        (r) => r,
      );

      return left(
        [
          cachedUserTeam,
          const TransferFailure.handShakeError(
              failedValue: "Could not connect to server. Try refreshing."),
        ],
      );
    }
    // unexpected error
    catch (e) {
      print(e);

      // get cache team
      Either<dynamic, UserTeam> cacheCall =
          await _transferLocalDataProvider.getUserTeam();
      UserTeam cachedUserTeam = cacheCall.fold(
        (l) => l[0],
        (r) => r,
      );

      return left(
        [
          cachedUserTeam,
          const TransferFailure.unexpectedError(
              failedValue: "Something went wrong. Try again!"),
        ],
      );
    }
  }

  Future<Either<dynamic, bool>> saveUserPlayers(
      {required int gameWeekId, required UserTeam userTeam}) async {
    // TODO: implement saveUserPlayers

    const userID = "627a7798bed9e567269bb8a9";

    print(userTeamToJson(userTeam: userTeam));

    // try {
    //   HTTPInstance instance = getIt<HTTPInstance>();

    //   var apiResponse = await instance.client.patch(
    //     Uri.parse('$_baseURL/user/team/$userID/$gameWeekId'),
    //     body: {
    //       "incomingTeam": jsonEncode(
    //         userTeamToJson(userTeam: userTeam),
    //       ),
    //     },
    //   ).timeout(
    //     const Duration(seconds: 30),
    //   );

    //   if (apiResponse.statusCode == 200) {
    //     return right(true);
    //   } else {
    //     return left(false);
    //   }
    // } catch (e) {
    //   return left(false);
    // }
    return right(false);
  }
}
