import 'package:flutter/material.dart';
import 'package:spajam2022/ui/styles/app_color.dart';

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
              padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TitleComponent(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                    child: Center(
                      child: Column(
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: AppColor.primary,
                              side: const BorderSide(color: AppColor.primary),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/roomroby');
                            },
                            child: const SizedBox(
                              width: 190,
                              height: 40,
                              child: Center(child: Text('ルームを作成')),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColor.primary,
                                side: const BorderSide(color: AppColor.primary),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/roomenter');
                              },
                              child: const SizedBox(
                                width: 190,
                                height: 40,
                                child: Center(child: Text('ルームに参加')),
                              ),
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
