import 'package:flutter/material.dart';
import 'package:spajam2022/ui/components/result/correct_batch.dart';
import 'package:spajam2022/ui/components/result/users_grid.dart';

class ResultDialog extends StatelessWidget {
  const ResultDialog(
      {super.key,
      required this.title,
      this.titleAlignStart = false,
      this.showStampLabel = false});

  final String title;
  final bool titleAlignStart;
  final bool showStampLabel;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      content: SingleChildScrollView(
        child: Container(
          width: width * 0.9,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline4,
                      textAlign:
                          titleAlignStart ? TextAlign.start : TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64),
                    child: Text("鬱",
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: const Color(0xFFFC8484))),
                  ),
                  if (showStampLabel)
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Transform.translate(
                          offset: const Offset(-0.5, 0),
                          child: Transform.rotate(
                              angle: 0.2,
                              child: const CorrectBatch(
                                isCorrect: false,
                              )),
                        ))
                ],
              ),
              const SizedBox(height: 60),
              const UsersGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
