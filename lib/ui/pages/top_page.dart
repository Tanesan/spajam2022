import 'package:flutter/material.dart';
import 'package:spajam2022/ui/components/increment_button.dart';



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
        padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('クイズ！', style: Theme.of(context).textTheme.headline3),
                  Row(
                    children: [
                      Text('この', style: Theme.of(context).textTheme.headline3),
                      Text('漢字', style: Theme.of(context).textTheme.headline3?.copyWith(color: Color(0xffFCC6E6E))),
                    ],
                  ),
                  Row(
                    children: [
                      Text('どんな', style: Theme.of(context).textTheme.headline3),
                      Text('感じ', style: Theme.of(context).textTheme.headline3?.copyWith(color: Color(0xff5585E2))),
                      Text('？', style: Theme.of(context).textTheme.headline3),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
              child: Center(
                child:  OutlinedButton(
                  child: Container(
                      width: 190,
                      height: 40,
                      child: Center(child: Text('はじめる'))),
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
            ),
          ],
        ),
      ),
    ));
  }
}
