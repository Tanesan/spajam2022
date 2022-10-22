import 'package:flutter/material.dart';
import 'package:spajam2022/ui/components/result/users_grid_item.dart';

class UsersGrid extends StatelessWidget {
  const UsersGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Column(
        children: [1, 2]
            .map(
              (_) => SizedBox(
                width: double.infinity,
                child: Row(
                    children: [1, 2]
                        .map(
                          (i) => Expanded(
                            child: UsersGridItem(
                              value: "断捨離",
                              isQuestioner: i == 1,
                              emphasisBorder: i != 1,
                            ),
                          ),
                        )
                        .toList()),
              ),
            )
            .toList()));
  }
}
