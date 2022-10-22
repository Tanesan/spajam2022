import 'package:flutter/material.dart';

import '../components/header_customized.dart';
import '../components/text_field_custom.dart';

class RoomEnterPage extends StatefulWidget {
  const RoomEnterPage({Key? key}) : super(key: key);

  @override
  State<RoomEnterPage> createState() => _RoomEnterPageState();
}

class _RoomEnterPageState extends State<RoomEnterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        HeaderCustomized(title: "ルーム参加"),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: TextFieldCustom(),
        )
      ],
    ));
  }
}
