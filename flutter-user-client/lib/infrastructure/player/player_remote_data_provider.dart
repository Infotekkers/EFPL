import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:efpl/domain/player/player.dart';
import 'package:efpl/domain/player/player_failures.dart';
import 'package:efpl/infrastructure/player/player_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@injectable
class PlayerRemoteDataProvider {
  http.Client? client = http.Client();

  static final String _baseUrl = "${dotenv.env["API"]}";

  PlayerRemoteDataProvider();

  Future<Either<PlayerFailure, Player>> getPlayer(String playerId) async {
    final Uri url = Uri.parse("$_baseUrl/players/getplayer/$playerId");

    try {
      final response = await client!.get(url);

      if (response.statusCode == 200) {
        PlayerDto playerDto = PlayerDto.fromJson(jsonDecode(response.body)[0]);

        return right(playerDto.toDomain());
      }

      return left(const PlayerFailure.serverError());
    } catch (e) {
      return left(const PlayerFailure.networkError());
    }
  }
}
