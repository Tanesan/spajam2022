import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Stack(children: <Widget>[
              Text('クイズ！',
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.white)),
              Text('クイズ！', style: Theme.of(context).textTheme.headline3),
            ]),
          ),
          Row(
            children: [
              Stack(children: <Widget>[
                Text('この',
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.white)),
                Text('この', style: Theme.of(context).textTheme.headline3),
              ]),
              Stack(
                children: <Widget>[
                  Text('漢字',
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Colors.white)),
                  Text('漢字',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: Color(0xffFCC6E6E))),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Stack(children: <Widget>[
                Text('どんな',
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.white)),
                Text('どんな', style: Theme.of(context).textTheme.headline3),
              ]),
              Stack(children: <Widget>[
                Text('感じ',
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.white)),
                Text('感じ',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: Color(0xff5585E2)))
              ]),
              Stack(
                children: <Widget>[
                  Text('？',
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Colors.white)),
                  Text('？', style: Theme.of(context).textTheme.headline3),
                ],
              )
            ],
          ),
        ]));
  }
}
