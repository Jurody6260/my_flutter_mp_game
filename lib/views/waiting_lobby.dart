import 'package:flutter/material.dart';
import 'package:my_flutter_mp_game/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../provider/room_data_provider.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({Key? key}) : super(key: key);

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdController;
  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
        text: Provider.of<RoomDataProvider>(context, listen: false)
            .roomData['_id']);
  }

  @override
  void dispose() {
    super.dispose();
    roomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Waiting for the other player..."),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          controller: roomIdController,
          hintText: '',
          isReadOnly: true,
        )
      ],
    );
  }
}
