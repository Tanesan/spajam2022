import 'package:flutter/material.dart';
import 'package:spajam2022/services/room_service.dart';

import '../components/title_encode.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    listenRoomData();
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TitleComponent(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
              child: Center(
                child: Column(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xffCF9090),
                        side: const BorderSide(color: Color(0xffCF9090)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        createRoom(name: 'yuta');
                      },
                      child: const SizedBox(
                          width: 190,
                          height: 40,
                          child: Center(child: Text('createRoom'))),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xffCF9090),
                        side: const BorderSide(color: Color(0xffCF9090)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/roomroby');
                      },
                      child: const SizedBox(
                          width: 190,
                          height: 40,
                          child: Center(child: Text('ルームを作成'))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xffCF9090),
                          side: const BorderSide(color: Color(0xffCF9090)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/roomenter');
                        },
                        child: const SizedBox(
                            width: 190,
                            height: 40,
                            child: Center(child: Text('ルームに参加'))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
