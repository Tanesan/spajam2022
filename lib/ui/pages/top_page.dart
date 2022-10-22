import 'package:flutter/material.dart';

import '../components/title_encode.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      // Image.asset(
      //   "resources/background.png",
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   fit: BoxFit.cover,
      // ),
      Scaffold(
          body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleComponent(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
                child: Center(
                  child: OutlinedButton(
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
      ))
    ]);
  }
}
