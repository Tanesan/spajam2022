import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String? suffix;
  final String hintText;
  final Function onPressed;
  final Widget? prefixIcon;
  final TextEditingController? InputController;

  const TextFieldCustom(
      {Key? key,
      this.suffix,
      required this.onPressed,
      required this.hintText,
      this.InputController,
      this.prefixIcon})
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
          controller: InputController,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xffEBEBEB),
                ),
              ),
              contentPadding: const EdgeInsets.fromLTRB(14, 10, 0, 10),
              prefixIcon: prefixIcon,
              fillColor: Colors.white,
              filled: true,
              focusColor: Colors.white,
              suffix: TextButton(
                  child: Text(suffix ?? ""), onPressed: () => onPressed()),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xffEBEBEB),
                ),
              ),
              helperStyle: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: const Color(0xffEBEBEB)),
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: const Color.fromARGB(255, 196, 196, 196)))),
    );
  }
}
