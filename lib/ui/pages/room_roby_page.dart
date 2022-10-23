import 'package:flutter/material.dart';
import 'package:spajam2022/domain/room/room.dart';
import 'package:spajam2022/domain/room/room_status.dart';
import 'package:spajam2022/services/room_service.dart';
import 'package:spajam2022/ui/pages/room_writing_page.dart';

import '../../constants.dart';
import '../components/header_customized.dart';
import '../components/my_outline_button.dart';
import '../components/text_field_custom.dart';

class RoomRobyPageArguments {
  final String roomId;

  RoomRobyPageArguments(this.roomId);
}

class RoomRobyPage extends StatefulWidget {
  const RoomRobyPage({Key? key}) : super(key: key);

  static const routeName = '/ROOM_ROBY';

  @override
  State<RoomRobyPage> createState() => _RoomRobyPageState();
}

class _RoomRobyPageState extends State<RoomRobyPage> {
  late String roomId;
  late final Stream<Room> stream;

  @override
  void initState() {
    super.initState();
    _listenGameStart();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RoomRobyPageArguments;
    roomId = args.roomId;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const HeaderCustomized(title: "ルーム"),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "ルームID",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFieldCustom(
                      suffix: "コピー",
                      hintText: "ルームID",
                      controller: TextEditingController(text: roomId),
                      onPressed: _copyRoomId,
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "参加者",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    StreamBuilder<Room>(
                      stream: listenRoomData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError || !snapshot.hasData) {
                          return const SizedBox();
                        }

                        final users = snapshot.data!.users;

                        return ListView.builder(
                          padding: const EdgeInsets.all(0),
                          itemCount: users.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final user = users[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextFieldCustom(
                                hintText: "ルームID",
                                onPressed: () {},
                                controller: TextEditingController(
                                  text: user.name,
                                ),
                                prefixIcon: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Constants.avatars[index],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 150),
                const MyOutlineButton(
                  onPressed: startGame,
                  text: "開始する",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _listenGameStart() {
    stream = listenRoomData();
    stream.listen((room) {
      if (room.status == RoomStatus.playing) {
        Navigator.of(context).pushNamed(RoomWritingPage.routeName);
      }
    });
  }

  void _copyRoomId() {
    //  TODO
  }
}
