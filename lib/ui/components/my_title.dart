import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  const MyTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Text(
              'クイズ！',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.white,
                  ),
            ),
            Text('クイズ！', style: Theme.of(context).textTheme.headline2),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            Stack(
              children: <Widget>[
                Text(
                  'この',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.white,
                      ),
                ),
                Text('この', style: Theme.of(context).textTheme.headline2),
              ],
            ),
            Stack(
              children: <Widget>[
                Text(
                  '漢字',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.white,
                      ),
                ),
                Text(
                  '漢字',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: const Color(0xfffcc6e6e)),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Stack(
              children: <Widget>[
                Text(
                  'どんな',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.white,
                      ),
                ),
                Text('どんな', style: Theme.of(context).textTheme.headline2),
              ],
            ),
            Stack(
              children: <Widget>[
                Text(
                  '感じ',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.white,
                      ),
                ),
                Text(
                  '感じ',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: const Color(0xff5585e2)),
                ),
              ],
            ),
            Transform.rotate(
              angle: .5,
              child: Stack(
                children: <Widget>[
                  Text(
                    '？',
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Colors.white,
                        ),
                  ),
                  Text('？', style: Theme.of(context).textTheme.headline2),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
