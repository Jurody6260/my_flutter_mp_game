import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_mp_game/provider/room_data_provider.dart';
import 'package:my_flutter_mp_game/screens/game_screen.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import 'socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;
  // EMITS
  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit("createRoom", {
        'nickname': nickname,
      });
    }
  }

  void joinRoom(String nickname, String roomID) {
    if (roomID.isNotEmpty && nickname.isNotEmpty) {
      _socketClient.emit("joinRoom", {
        'nickname': nickname,
        'roomID': roomID,
      });
    }
  }

  // LISTENERS
  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on("createRoomSuccess", (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void joinRoomSuccessListener(BuildContext context) {
    _socketClient.on("joinRoomSuccess", (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void errorOccuredListener(BuildContext context) {
    _socketClient.on("errorOccured", (error) {
      showSnackBar(context, error);
    });
  }

  void updatePlayersState(BuildContext context) {
    _socketClient.on("updatePlayers", (players) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1(players[0]);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1(players[1]);
    });
  }


  void updateRoomListener(BuildContext context){
    _socketClient.on("updateRoom", (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      
    });
  }
}
