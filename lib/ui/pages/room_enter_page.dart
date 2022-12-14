import 'package:flutter/material.dart';
import 'package:spajam2022/ui/pages/room_roby_page.dart';

import '../../services/room_service.dart';
import '../components/header_customized.dart';
import '../components/text_field_custom.dart';
import '../styles/app_color.dart';

class RoomEnterPage extends StatefulWidget {
  const RoomEnterPage({Key? key}) : super(key: key);

  static const routeName = '/ROOM_ENTER';

  @override
  State<RoomEnterPage> createState() => _RoomEnterPageState();
}

class _RoomEnterPageState extends State<RoomEnterPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const HeaderCustomized(title: "ルーム参加"),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                TextFieldCustom(
                  onPressed: () => {},
                  hintText: "ユーザー名を入力",
                  controller: _controller,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: TextFieldCustom(
                    onPressed: () => {},
                    hintText: "ルームIDを入力",
                    suffix: "確定",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColor.primary,
                      side: const BorderSide(color: AppColor.primary),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    onPressed: moveNext,
                    child: const SizedBox(
                      width: 190,
                      height: 40,
                      child: Center(child: Text('参加する')),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void moveNext() async {
    final name = _controller.text;
    await enterRoom(name: name);

    if (!mounted) return;
    Navigator.of(context).pushNamed(
      RoomRobyPage.routeName,
      arguments: RoomRobyPageArguments(roomId),
    );
  }
}
