import 'package:flutter/material.dart';
import 'package:spajam2022/ui/components/my_outline_button.dart';

import '../components/my_title.dart';
import 'room_create_page.dart';
import 'room_enter_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = "/HOME";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "assets/images/pink_backend.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(30, 250, 30, 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MyTitle(),
                Column(
                  children: [
                    MyOutlineButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(RoomCreatePage.routeName),
                      text: "ルームを作成",
                    ),
                    const SizedBox(height: 20),
                    MyOutlineButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(RoomEnterPage.routeName),
                      text: "ルームに参加",
                    ),
                  ],
                ),
              ],
            ),
          ))
    ]);
  }
}
