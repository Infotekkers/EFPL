import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/application/points/points_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketApi {
  // A static private instance to access _socketApi from inside class only
  static final SocketApi _socketApi = SocketApi._internal();

  // An internal private constructor to access it for only once for static instance of class.
  SocketApi._internal();

  // Factory constructor to return same static instance every time you create any object.
  factory SocketApi() {
    var socket = io.io(dotenv.env["API"].toString(), <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();

    socket.on(
      "fixtureUpdated",
      (data) => {
        getIt<FixtureBloc>().add(
          const FixtureEvent.loadFixtures(),
        ),
      },
    );

    socket.on(
      "fixtureLineUpUpdated",
      (data) => {
        getIt<FixtureBloc>().add(
          const FixtureEvent.loadFixtures(),
        ),
      },
    );

    socket.on(
      "playerScoreUpdated",
      (data) => {
        getIt<PointsBloc>().add(
          const PointsEvent.getPointsInfo(),
        ),
      },
    );

    return _socketApi;
  }
}
