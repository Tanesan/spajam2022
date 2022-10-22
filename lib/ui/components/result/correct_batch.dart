import 'package:flutter/material.dart';

class CorrectBatch extends StatelessWidget {
  const CorrectBatch({Key? key, this.postFix, this.isCorrect = true})
      : super(key: key);

  final String? postFix;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return (Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                width: 3,
                color: isCorrect
                    ? const Color(0xFFFC8484)
                    : const Color(0xFF666666))),
        child: Text(
          isCorrect ? "正解" : "不正解",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 28,
              color:
                  isCorrect ? const Color(0xFFFC8484) : const Color(0xFF666666),
              fontWeight: FontWeight.bold,
              height: 1.2,
              letterSpacing: -0.1),
        )));
  }
}
