import 'package:flutter/material.dart';
import 'package:spajam2022/ui/components/result/award_batch.dart';

class UsersGridItem extends StatelessWidget {
  const UsersGridItem(
      {Key? key,
      required this.isQuestioner,
      required this.value,
      this.trailingLabel,
      this.emphasisBorder = false})
      : assert(!isQuestioner || value != null),
        super(key: key);

  final bool isQuestioner;
  final String? value;
  final Widget? trailingLabel;
  final bool emphasisBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEBEBEB)),
      ),
      child: Stack(
        children: [
          if (emphasisBorder)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFFC8484), width: 2),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 44),
            child: Center(
              child: isQuestioner
                  ? Text("出題者",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey[400]))
                  : Text(value!,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
          Positioned(
              top: 6,
              left: 6,
              right: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                      width: 30,
                      height: 30,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://precious.ismcdn.jp/mwimgs/c/3/1080/img_c329b2977f0c543bb74a7e1b39dbfa47698703.jpg",
                        ),
                      )),
                  if (emphasisBorder)
                    const AwardBatch(
                      "正解",
                      postFix: " +1",
                    )
                ],
              ))
        ],
      ),
    );
  }
}
