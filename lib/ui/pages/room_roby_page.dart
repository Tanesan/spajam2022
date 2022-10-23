import 'package:flutter/material.dart';
import 'package:spajam2022/domain/room/room.dart';
import 'package:spajam2022/services/room_service.dart';
import 'package:spajam2022/ui/styles/app_color.dart';

import '../components/header_customized.dart';
import '../components/text_field_custom.dart';

class RoomRobyPageArguments {
  final String roomId;

  RoomRobyPageArguments(this.roomId);
}

class RoomRobyPage extends StatefulWidget {
  const RoomRobyPage({Key? key}) : super(key: key);

  static const routeName = '/roomroby';

  @override
  State<RoomRobyPage> createState() => _RoomRobyPageState();
}

class _RoomRobyPageState extends State<RoomRobyPage> {
  late String roomId;

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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("ルームID", textAlign: TextAlign.left),
                          ],
                        ),
                      ),
                      TextFieldCustom(
                        suffix: "コピー",
                        hintText: "ルームID",
                        InputController: TextEditingController(text: roomId),
                        onPressed: _copyRoomId,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [Text("参加者")],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: StreamBuilder<Room>(
                              stream: listenRoomData(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError || !snapshot.hasData) {
                                  return const SizedBox();
                                }

                                final users = snapshot.data!.users;

                                return ListView.builder(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    itemCount: users.length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final user = users[index];
                                      return Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 20, 0, 0),
                                          child: TextFieldCustom(
                                            hintText: "ルームID",
                                            onPressed: () {},
                                            InputController:
                                                TextEditingController(
                                              text: user.name,
                                            ),
                                            // prefixIcon: CircleAvatar(
                                            //   backgroundColor:
                                            //       Colors.transparent,
                                            //   child: Constants.avatars[index],
                                            // ),
                                          ));
                                    });
                              }),
                        ),
                      ],
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
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/home');
                      },
                      child: const SizedBox(
                        width: 190,
                        height: 40,
                        child: Center(child: Text('開始する')),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void _copyRoomId() {
    //  TODO
  }
}
