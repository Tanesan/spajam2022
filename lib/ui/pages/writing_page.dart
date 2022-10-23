import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:spajam2022/ui/styles/app_color.dart';

import '../../constants.dart';
import '../../domain/user/user.dart';
import '../components/Painter.dart';

class WritingPage extends StatefulWidget {
  final _controller = PaintController();

  WritingPage({Key? key}) : super(key: key);

  @override
  State<WritingPage> createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  late final List<User> users;
  late final int index;
  late final String problem;
  late final String problemPrefix;
  late final String problemSuffix;

  @override
  void initState() {
    super.initState();
    users = [
      User(name: "user1", type: UserType.writer, answer: "", score: 200),
      User(name: "user2", type: UserType.reader, answer: "", score: 180),
      User(name: "user3", type: UserType.reader, answer: "", score: 80),
      User(name: "user4", type: UserType.reader, answer: "", score: 0),
    ];
    index = 0;
    problem = "うつ";
    problemPrefix = "";
    problemSuffix = "病にかかる";
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Constants.avatars[_writerIndex()],
                    ),
                    Text("出題者", style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
                CountdownTimer(
                  endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 60,
                  widgetBuilder: (context, time) {
                    if (time == null) {
                      _updateStatus();
                      widget._controller.clear();
                      return Text(
                        "時間切れ",
                        style: Theme.of(context).textTheme.bodyText1,
                      );
                    }

                    return Text(
                      "残り${time.sec}秒",
                      style: Theme.of(context).textTheme.bodyText1,
                    );
                  },
                ),
              ],
            ),
          ),
          // TODO: 時間の進み具合を表示するようにする
          const SizedBox(height: 10),
          const Divider(height: 0, thickness: 3, color: AppColor.primary),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: Constants.avatars
                  .asMap()
                  .entries
                  .map((entry) => Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: entry.value,
                          ),
                          Text("${users[entry.key].score}点")
                        ],
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              color: AppColor.primary,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "お題",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(color: Colors.black45),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Text.rich(TextSpan(
                            text: problemPrefix,
                            style: Theme.of(context).textTheme.headline4,
                            children: [
                              TextSpan(
                                text: " $problem ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              TextSpan(
                                text: problemSuffix,
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ])),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: AppColor.primary,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Text(
                          "あなたが書く番です",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Colors.black45),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: deviceSize.width,
                    height: deviceSize.width * 0.9,
                    child: Painter(
                      paintController: widget._controller,
                      index: index,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // TODO: Update status of Realtime Database
  void _updateStatus() {}

  int _writerIndex() {
    for (var i = 0; i < users.length; i++) {
      var user = users[i];
      if (user.type == UserType.writer) return i;
    }
    throw StateError("Writer user was not found");
  }
}
