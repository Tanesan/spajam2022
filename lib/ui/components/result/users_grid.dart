import 'package:flutter/material.dart';
import 'package:spajam2022/ui/components/result/users_grid_item.dart';

class UsersGrid extends StatelessWidget {
  const UsersGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Column(children: [
      SizedBox(
          width: double.infinity,
          child: Row(children: const <Widget>[
            Expanded(
              child: UsersGridItem(
                value: "鬱",
                isQuestioner: false,
                emphasisBorder: true,
              ),
            ),
            Expanded(
              child: UsersGridItem(
                value: "林",
                isQuestioner: false,
                emphasisBorder: false,
              ),
            )
          ])),
      SizedBox(
          width: double.infinity,
          child: Row(children: const <Widget>[
            Expanded(
              child: UsersGridItem(
                value: "無",
                isQuestioner: false,
                emphasisBorder: false,
              ),
            ),
            Expanded(
              child: UsersGridItem(
                value: "缶",
                isQuestioner: false,
                emphasisBorder: false,
              ),
            )
          ]))
    ]));
  }
}
