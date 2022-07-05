import 'package:flutter/material.dart';
import 'package:my_flutter_mp_game/resources/socket_methods.dart';
import 'package:provider/provider.dart';

import '../provider/room_data_provider.dart';
import '../views/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  static String routeName = "/game";
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    super.initState();
    print("Game screen was initialized");
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersState(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    print("GameScreen build isjoin is ${roomDataProvider.roomData['isJoin']}");
    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : Center(
              child: Text(
                Provider.of<RoomDataProvider>(context).roomData.toString(),
              ),
            ),
    );
  }
}
