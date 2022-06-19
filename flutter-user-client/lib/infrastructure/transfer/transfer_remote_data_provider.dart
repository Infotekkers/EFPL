// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:efpl/application/transfer/transfer_bloc.dart';
import 'package:efpl/domain/transfer/transfer_failures.dart';
import 'package:efpl/domain/transfer/user_player.dart';
import 'package:efpl/domain/transfer/user_team.dart';
import 'package:efpl/domain/transfer/value_objects.dart';
import 'package:efpl/infrastructure/transfer/transfer_local_data_provider.dart';
import 'package:efpl/infrastructure/transfer/user_player_dto.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/services/constants.dart';
import 'package:efpl/services/http_instance.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TransferRemoteDataProvider {
  HTTPInstance instance = getIt<HTTPInstance>();

  final String _baseURL = dotenv.env["API"].toString();

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
            multiplier: 0,
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

          final Either<dynamic, List<UserPlayer>> result =
              await _transferLocalDataProvider.getAllPlayersInPosition(
                  playerPosition: playerPosition);

          // if (!(result.isRight() &&
          //     result.fold((l) => [], (r) => r).isNotEmpty)) {
          // add to cache
          _transferLocalDataProvider.saveAllPlayersInPosition(
            allPlayersInPosition: allPlayers,
            playersPosition: playerPosition,
          );
          // }
        }
        return right(allPlayersInPosition);
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

        if (parseResponseTeam.length > 0 &&
            parseResponseTeam['players'].length > 0) {
          // List allPlayers = parseResponseTeam['players'];
          // for (var i = 0; i < allPlayers.length; i++) {
          //   Map<String, dynamic> availability = {
          //     "injuryStatus":
          //         allPlayers[i]['availability']['injuryStatus'] ?? "",
          //     "injuryMessage":
          //         allPlayers[i]['availability']['injuryMessage'] ?? ""
          //   };

          //   allPlayers[i]['availability'] = availability;

          //   final UserPlayerDTO userPlayerDTO =
          //       UserPlayerDTO.fromJson(allPlayers[i]);

          //   allUserPlayersJson.add(allPlayers[i]);
          //   allUserPlayers.add(userPlayerDTO.toDomain());
          // }

          for (var i = 0; i < parseResponseTeam['players'].length; i++) {
            List allPlayers = parseResponseTeam['players'];
            Map<String, dynamic> availability = {
              "injuryStatus":
                  allPlayers[i]['availability']['injuryStatus'] ?? "",
              "injuryMessage":
                  allPlayers[i]['availability']['injuryMessage'] ?? ""
            };

            allPlayers[i]['availability'] = availability;

            final UserPlayerDTO userPlayerDTO =
                UserPlayerDTO.fromJson(allPlayers[i]);
            allUserPlayersJson.add(allPlayers[i]);
            allUserPlayers.add(userPlayerDTO.toDomain());
          }

          // Team
          UserTeam userTeam = UserTeam(
            gameWeekId: GameWeekId(
              value: int.parse(
                parseResponseTeam['gameweekId'].toString(),
              ),
            ),
            gameWeekDeadline: parsedResponseBody['gameWeekDeadline'].toString(),
            allUserPlayers: allUserPlayers,
            freeTransfers: int.parse(
              parseResponseTeam['freeTransfers'].toString(),
            ),
            deduction: int.parse(
              parseResponseTeam['deduction'].toString(),
            ),
            activeChip: parseResponseTeam['activeChip'].toString(),
            availableChips: parsedResponseBody['availableChips'],
            maxBudget: double.parse(
              parsedResponseBody['maxBudget'].toString(),
            ),
            teamName: parsedResponseBody['teamName'].toString(),
          );

          Map userTeamJson = {
            "gameWeekId": int.parse(
              parseResponseTeam['gameweekId'].toString(),
            ),
            "gameWeekDeadline":
                parsedResponseBody['gameWeekDeadline'].toString(),
            "allUserPlayers": allUserPlayersJson,
            "freeTransfers":
                int.parse(parseResponseTeam['freeTransfers'].toString()),
            "deduction": int.parse(
              parseResponseTeam['deduction'].toString(),
            ),
            "activeChip": parseResponseTeam['activeChip'],
            "availableChips": parsedResponseBody['availableChips'],
            "maxBudget": double.parse(
              parsedResponseBody['maxBudget'].toString(),
            ),
            "teamName": parsedResponseBody['teamName'].toString(),
          };

          // // ADD to cache
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
                "teamName": parsedResponseBody[i]['teamName'].toString(),
                "teamLogo": parsedResponseBody[i]['teamLogo'].toString(),
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
                "teamName": parsedResponseBody[i]['teamName'].toString(),
                "teamLogo": parsedResponseBody[i]['teamLogo'].toString(),
              };
              allTeams.add(currentTeam);
            }
            // Add to cache
            _transferLocalDataProvider.saveAllTeamsAndLogo(allTeams: allTeams);
          }

          return left(
            [
              UserTeam(
                gameWeekId: GameWeekId(value: 1),
                gameWeekDeadline:
                    parsedResponseBody['gameWeekDeadline'].toString(),
                allUserPlayers: [],
                freeTransfers: 0,
                deduction: 0,
                activeChip: '',
                availableChips: parsedResponseBody['availableChips'],
                maxBudget:
                    double.parse(parsedResponseBody['maxBudget'].toString()),
                teamName: parsedResponseBody['teamName'],
              ),
              const TransferFailure.noTeamSelected(
                  failedValue: "No Team. Please select a team.")
            ],
          );
        }
      }

      // no user team
      else if (apiResponse.statusCode == 404) {
        Map parseResponseBody = jsonDecode(apiResponse.body);

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
              "teamName": parsedResponseBody[i]['teamName'].toString(),
              "teamLogo": parsedResponseBody[i]['teamLogo'].toString(),
            };
            allTeams.add(currentTeam);
          }

          // Add to cache
          _transferLocalDataProvider.saveAllTeamsAndLogo(allTeams: allTeams);
        }

        return left(
          [
            UserTeam(
              gameWeekId: GameWeekId(value: 1),
              gameWeekDeadline:
                  parseResponseBody['gameWeekDeadline'].toString(),
              allUserPlayers: [],
              freeTransfers: 0,
              deduction: 0,
              activeChip: "",
              availableChips: parseResponseBody['availableChips'],
              maxBudget: double.parse(
                parseResponseBody['maxBudget'].toString(),
              ),
              teamName: parseResponseBody['teamName'].toString(),
            ),
            const TransferFailure.noTeamSelected(
              failedValue: "No Initial Team",
            ),
          ],
        );
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
          const TransferFailure.noTeamSelected(
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
      // get cache team
      return left([
        UserTeam(
          gameWeekId: GameWeekId(value: 1),
          gameWeekDeadline: "",
          allUserPlayers: [],
          freeTransfers: 0,
          deduction: 0,
          activeChip: "",
          availableChips: [],
          maxBudget: 100,
          teamName: "",
        ),
        const TransferFailure.noTeamSelected(
            failedValue: "Something went wrong. Try again!")
      ]);
    }
  }

  Future<Either<dynamic, bool>> saveUserPlayers({
    required Map userTeam,
  }) async {
    try {
      var apiResponse =
          await instance.client.patch(Uri.parse('$_baseURL/user/team'), body: {
        "data": jsonEncode(userTeam),
      }).timeout(
        Duration(
          seconds: ConstantValues().httpTimeOutDuration,
        ),
      );

      // success
      if (apiResponse.statusCode == 201) {
        getIt<TransferBloc>().add(
          const TransferEvent.getUserPlayers(),
        );
        return right(true);
      }
      // token issue
      else if (apiResponse.statusCode == 401) {
        return left(
          [
            false,
            const TransferFailure.unauthorized(
              failedValue: "Please Login!",
            ),
          ],
        );
      }
      // token issue
      else if (apiResponse.statusCode == 403) {
        return left(
          [
            false,
            const TransferFailure.unauthenticated(
              failedValue: "Please Login!",
            ),
          ],
        );
      }
      // 404
      else if (apiResponse.statusCode == 404) {
        return left(
          [
            [],
            const TransferFailure.unexpectedError(
              failedValue: "Something went wrong",
            ),
          ],
        );
      }
      // unexpected
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
      //  cache
      _transferLocalDataProvider.saveUserTeamChanges(changedUserTeam: userTeam);
      return left(
        [
          true,
          const TransferFailure.noConnection(
              failedValue: "Could not connect to server. Try refreshing.")
        ],
      );
    }
    // Socket Exception
    on SocketException catch (_) {
      //  cache
      _transferLocalDataProvider.saveUserTeamChanges(changedUserTeam: userTeam);
      return left(
        [
          true,
          const TransferFailure.socketError(
              failedValue: "Could not connect to server. Try refreshing."),
        ],
      );
    }

    // Handshake error
    on HandshakeException catch (_) {
      //  cache
      _transferLocalDataProvider.saveUserTeamChanges(changedUserTeam: userTeam);
      return left(
        [
          true,
          const TransferFailure.handShakeError(
              failedValue: "Could not connect to server. Try refreshing."),
        ],
      );
    }
    // unexpected error
    catch (e) {
      //  cache
      _transferLocalDataProvider.saveUserTeamChanges(changedUserTeam: userTeam);

      return left(
        [
          true,
          const TransferFailure.unexpectedError(
              failedValue: "Something went wrong. Try again!"),
        ],
      );
    }
  }
}
