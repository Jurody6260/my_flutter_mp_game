import 'package:flutter/material.dart';

import '../models/player.dart';

class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {};
  Player _player1 = Player(
    nickname: '',
    socketID: '',
    points: 0.0,
    playerType: 'X',
  );

  Player _player2 = Player(
    nickname: '',
    socketID: '',
    points: 0.0,
    playerType: 'O',
  );

  Map<String, dynamic> get roomData => _roomData;
  Player get player1 => _player1;
  Player get player2 => _player2;

  void updateRoomData(Map<String, dynamic> roomData) {
    _roomData = roomData;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> player1) {
    _player1 = Player.fromMap(player1);
    notifyListeners();
  }
  void updatePlayer2(Map<String, dynamic> player2) {
    _player2 = Player.fromMap(player2);
    notifyListeners();
  }
}
