import 'package:flutter/material.dart';

import '../components/title_encode.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "assets/images/pink_backend.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleComponent(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
                    child: Center(
                      child: Column(
                        children: [
                          OutlinedButton(
                            child: Container(
                                width: 190,
                                height: 40,
                                child: Center(child: Text('ルームを作成'))),
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color(0xffCF9090),
                              side: BorderSide(color: Color(0xffCF9090)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/roomroby');
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: OutlinedButton(
                              child: Container(
                                  width: 190,
                                  height: 40,
                                  child: Center(child: Text('ルームに参加'))),
                              style: OutlinedButton.styleFrom(
                                primary: Colors.white,
                                side: BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/roomenter');
                              },
                            ),
                          ),
                        ],
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
