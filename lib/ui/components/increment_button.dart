import 'package:flutter/material.dart';

class IncrementButton extends StatelessWidget {
  final void Function() onPressed;

  const IncrementButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
