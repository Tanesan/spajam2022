import 'package:flutter/material.dart';

import '../styles/app_color.dart';

class MyOutlineButton extends StatelessWidget {
  const MyOutlineButton({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primary,
        side: const BorderSide(color: AppColor.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: 50,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
