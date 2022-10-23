import 'package:flutter/material.dart';

import '../../services/room_service.dart';
import '../components/header_customized.dart';
import '../components/text_field_custom.dart';
import 'room_roby_page.dart';

class RoomCreatePage extends StatefulWidget {
  const RoomCreatePage({Key? key}) : super(key: key);

  static const routeName = 'roomcrate';

  @override
  State<RoomCreatePage> createState() => _RoomCreatePageState();
}

class _RoomCreatePageState extends State<RoomCreatePage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const HeaderCustomized(title: "ルーム作成"),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: TextFieldCustom(
              InputController: _controller,
              hintText: "ユーザー名を入力",
              suffix: "作成",
              onPressed: _moveNext,
            ),
          ),
        ],
      ),
    );
  }

  void _moveNext() async {
    final roomId = await createRoom(name: _controller.text);

    if (!mounted) return;
    Navigator.of(context).pushNamed(
      RoomRobyPage.routeName,
      arguments: RoomRobyPageArguments(roomId),
    );
  }
}
