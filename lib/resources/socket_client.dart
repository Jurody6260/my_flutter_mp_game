// ignore: library_prefixes
import "package:socket_io_client/socket_io_client.dart" as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    print("socket here");

    socket = IO.io("http://localhost:5050", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();
    socket!.onConnect((_) {
      print('connect');
      socket!.emit('msg', 'test');
    });
    socket!.onDisconnect((_) => print('disconnect'));
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
