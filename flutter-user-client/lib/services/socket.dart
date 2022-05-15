import 'package:efpl/application/fixture/fixture_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketApi {
  // A static private instance to access _socketApi from inside class only
  static final SocketApi _socketApi = SocketApi._internal();

  // An internal private constructor to access it for only once for static instance of class.
  SocketApi._internal();

  // Factory constructor to return same static instance every time you create any object.
  factory SocketApi() {
    var socket = IO.io("http://172.20.10.13:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    // socket.onConnect(
    //   (data) => ,
    // );

    socket.on(
      "fixtureUpdated",
      (data) => {
        print("Socket Update"),
        getIt<FixtureBloc>().add(
          const FixtureEvent.loadFixtures(),
        ),
      },
    );

    return _socketApi;
  }

  // All socket related functions.
  void addOnEvent() {}
}
