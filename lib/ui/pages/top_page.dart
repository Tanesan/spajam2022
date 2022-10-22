import 'package:flutter/material.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('クイズ！', style: Theme.of(context).textTheme.headline3),
                  Row(
                    children: [
                      Text('この', style: Theme.of(context).textTheme.headline3),
                      Text('漢字',
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(color: const Color(0xfffcc6e6e))),
                    ],
                  ),
                  Row(
                    children: [
                      Text('どんな', style: Theme.of(context).textTheme.headline3),
                      Text('感じ',
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(color: const Color(0xff5585E2))),
                      Text('？', style: Theme.of(context).textTheme.headline3),
                    ],
                  )
                ],
              ),
            ),
            // NOTE: 動作確認用
            // ElevatedButton(
            //   onPressed: () {
            //     showDialog(
            //         context: context,
            //         builder: (_) => const ResultDialog(title: "AI予想..."));
            //   },
            //   child: const Text('Show Modal'),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
              child: Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xffCF9090),
                    side: const BorderSide(color: Color(0xffCF9090)),
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
                      child: Center(child: Text('はじめる'))),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
