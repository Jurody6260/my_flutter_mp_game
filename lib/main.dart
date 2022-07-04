import 'package:flutter/material.dart';
import 'package:my_flutter_mp_game/screens/create_room_screen.dart';
import 'package:my_flutter_mp_game/screens/main_menu_screen.dart';
import 'package:my_flutter_mp_game/utils/colors.dart';

import 'screens/join_room_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
      ),
      routes: {
        MainMenuScreen.routeName: (context) => const MainMenuScreen(),
        CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
        JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
        // '/settings': (context) => MainMenuScreen(),
      },
      initialRoute: MainMenuScreen.routeName,
    );
  }
}
