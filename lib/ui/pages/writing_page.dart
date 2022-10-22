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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Constants.avatars[writerIndex()],
                    ),
                    Text("出題者", style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
                CountdownTimer(
                  endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 60,
                  widgetBuilder: (context, time) {
                    if (time == null) {
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
          Container(
            color: AppColor.primary,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
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
                              .titleLarge
                              ?.copyWith(color: Colors.black45),
                        ),
                      ],
                    ),
                    Text.rich(TextSpan(
                        text: problemPrefix,
                        style: Theme.of(context).textTheme.headline4,
                        children: [
                          TextSpan(
                            text: " $problem ",
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                          ),
                          TextSpan(
                            text: problemSuffix,
                            style: Theme.of(context).textTheme.headline4,
                          )
                        ]))
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: deviceSize.width,
            height: deviceSize.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              color: Colors.white,
            ),
            child: Painter(paintController: widget._controller),
          ),
        ],
      ),
    );
  }

  int writerIndex() {
    for (var i = 0; i < users.length; i++) {
      var user = users[i];
      if (user.type == UserType.writer) return i;
    }
    throw StateError("Writer user was not found");
  }
}
