import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String? suffix;
  final String hintText;
  final Function onPressed;

  const TextFieldCustom(
      {Key? key, this.suffix, required this.onPressed, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 350,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 8,
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: TextFormField(
          decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        focusColor: Colors.white,
        suffix:
            TextButton(child: Text(suffix ?? ""), onPressed: () => onPressed()),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xffEBEBEB),
          ),
        ),
        helperStyle: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(color: const Color(0xffC0C0C0)),
        hintText: hintText,
      )),
    );
  }
}
