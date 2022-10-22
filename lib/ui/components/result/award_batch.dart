import 'package:flutter/material.dart';

class AwardBatch extends StatelessWidget {
  const AwardBatch(this.value, {Key? key, this.postFix}) : super(key: key);

  final String value;
  final String? postFix;

  @override
  Widget build(BuildContext context) {
    return (Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2, color: const Color(0xFFFC8484))),
        child: RichText(
            text: TextSpan(
          children: [
            TextSpan(text: value),
            TextSpan(text: postFix, style: const TextStyle(fontSize: 12)),
          ],
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: const Color(0xFFFC8484),
              fontWeight: FontWeight.bold,
              height: 1.2,
              letterSpacing: -0.1),
        ))));
  }
}
