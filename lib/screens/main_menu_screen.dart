import 'package:flutter/material.dart';

import '../responsive/responsive.dart';
import '../widgets/custom_button.dart';
import 'create_room_screen.dart';
import 'join_room_screen.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({Key? key}) : super(key: key);

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Main Menu',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () {
                createRoom(context);
              },
              text: 'Create room',
            ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () {
                joinRoom(context);
              },
              text: 'Join room',
            ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
              text: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
