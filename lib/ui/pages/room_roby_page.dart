import 'package:flutter/material.dart';

import '../components/header_customized.dart';
import '../components/text_field_custom.dart';

class RoomRobyPage extends StatefulWidget {
  const RoomRobyPage({Key? key}) : super(key: key);

  @override
  State<RoomRobyPage> createState() => _RoomRobyPageState();
}

class _RoomRobyPageState extends State<RoomRobyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        HeaderCustomized(title: "ルーム"),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("ルームID", textAlign: TextAlign.left),
                      ],
                    ),
                  ),
                  TextFieldCustom(
                      suffix: "コピー",
                      hintText: "ルームID",
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/roomroby')),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("参加者", textAlign: TextAlign.left),
                        ],
                      ),
                    ),
                    TextFieldCustom(hintText: "ルームID", onPressed: () {}),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child:
                          TextFieldCustom(hintText: "ルームID", onPressed: () {}),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child:
                          TextFieldCustom(hintText: "ルームID", onPressed: () {}),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: OutlinedButton(
                  child: Container(
                      width: 190,
                      height: 40,
                      child: Center(child: Text('開始する'))),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Color(0xffCF9090),
                    side: BorderSide(color: Color(0xffCF9090)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
